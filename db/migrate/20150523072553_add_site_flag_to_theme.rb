class AddSiteFlagToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :site, :boolean
  end
end
