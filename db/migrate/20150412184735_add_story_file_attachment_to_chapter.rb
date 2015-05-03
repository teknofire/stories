class AddStoryFileAttachmentToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :story_id, :string
    add_column :chapters, :story_filename, :string
    add_column :chapters, :story_size, :integer
    add_column :chapters, :story_content_type, :string
  end
end
