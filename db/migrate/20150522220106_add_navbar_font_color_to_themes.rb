class AddNavbarFontColorToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :navbar_font_color, :string
  end
end
