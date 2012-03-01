class AddStatusToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :active, :boolean
  end
end
