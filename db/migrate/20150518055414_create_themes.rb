class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.string :background
      t.string :navbar

      t.timestamps null: false
    end
  end
end
