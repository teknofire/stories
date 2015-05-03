class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file_id
      t.integer :file_size
      t.string :file_filename
      t.string :file_content_type
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
