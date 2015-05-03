class AddSeenFlagToPages < ActiveRecord::Migration
  def change
    add_column :pages, :seen, :boolean
  end
end
