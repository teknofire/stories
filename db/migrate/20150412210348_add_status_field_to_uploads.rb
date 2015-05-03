class AddStatusFieldToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :status, :string, default: 'queued'
  end
end
