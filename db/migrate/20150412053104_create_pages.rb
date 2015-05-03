class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :sequence
      t.string :image_id
      t.string :image_filename
      t.integer :image_size
      t.string :image_content_type
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
