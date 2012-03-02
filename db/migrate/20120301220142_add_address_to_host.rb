class AddAddressToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :address, :string
  end
end
