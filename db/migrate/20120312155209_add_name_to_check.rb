class AddNameToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :name, :string
    add_column :hosts, :snmp_community, :string
  end
end
