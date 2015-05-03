class AddUploadReferenceToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :upload, index: true, foreign_key: true
  end
end
