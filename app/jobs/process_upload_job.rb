class ProcessUploadJob < ActiveJob::Base
  queue_as :default

  def perform(upload)
    upload.update_attribute(:status, 'Importing')
    Dir.mktmpdir("upload-#{upload.file_filename}-#{upload.id}") do |dir|
      file = upload.file.download
      unzip = Mixlib::ShellOut.new("unzip #{file.path} -d #{dir} ")
      unzip.run_command

      if unzip.status.exitstatus == 0
        logger.info "Unzipping #{upload.file_filename} successful"
        logger.info unzip.stdout
      else
        logger.info "Error unzipping #{upload.file_filename}"
        logger.info unzip.stderr
      end

      entries = Dir.entries(dir)

      if entries.include?('Storytelling') && has_stories?('Storytelling')
        import_story_chapters(upload, 'Storytelling')
      elsif has_stories?(dir)
        import_story_chapters(upload, dir)
      else
        import_images_as_chapter(upload, dir)
      end
    end
    upload.update_attribute(:status, 'Imported')
  rescue => e
    logger.error e.message
    logger.error e.backtrace
    upload.update_attribute(:status, 'Error')
  end

  def has_stories?(path)
    Dir.glob(File.join(path, '*.xml')).count > 0
  end

  def import_images_as_chapter(upload, path)
    logger.info "Looking for images to make a chapter"

    chapter = upload.chapters.create(title: upload.file_filename)

    count = 0
    Dir.chdir(path) do
      Dir.glob('*.png').each do |image|
        page = chapter.pages.build
        page.image = File.open(image, 'rb')
        page.image.read
        page.sequence = count
        page.save

        count += 1
      end
    end
  end

  def import_story_chapters(upload, path)
    logger.info "Looking for story files in #{path}"
    Dir.chdir(path) do
      stories = Dir.glob('*.xml')

      stories.each do |story|
        chapter = upload.chapters.where(story_filename: story).first_or_initialize
        chapter.story = File.open(story, 'rb')
        chapter.save
        chapter.import_pages
      end
    end
  end
end
