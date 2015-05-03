class ProcessUploadJob < ActiveJob::Base
  queue_as :default

  def perform(upload)
    upload.update_attribute(:status, 'Importing')
    Dir.mktmpdir("upload-#{upload.file_filename}-#{upload.id}") do |dir|
      Dir.chdir(dir) do
        file = upload.file.download
        unzip = Mixlib::ShellOut.new("unzip #{file.path} -d . ")
        unzip.run_command

        if unzip.status.exitstatus == 0
          logger.info "Unzipping #{upload.file_filename} successful"
          logger.info unzip.stdout
        else
          logger.info "Unzipping #{upload.file_filename} successful"
          logger.info unzip.stderr
        end

        entries = Dir.entries('.')

        if entries.include?('Storytelling')
          import_chapters(upload, 'Storytelling')
        else
          import_chapters(upload, '.')
        end
      end
    end
    upload.update_attribute(:status, 'Imported')
  end

  def import_chapters(upload, path)
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
