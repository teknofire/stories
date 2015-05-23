class AddPanelColorToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :panel_color, :string
  end
end
