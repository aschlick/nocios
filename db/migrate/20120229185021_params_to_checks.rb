class ParamsToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :params, :text
    add_column :checks, :active, :boolean
  end
end
