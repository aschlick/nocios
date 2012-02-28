class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :telnet_user
      t.string :telnet_password
      t.string :ssh_user
      t.string :ssh_password
      t.integer :external_id
      t.timestamps
    end
  end
end
