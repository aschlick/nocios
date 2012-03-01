class AddIndexes < ActiveRecord::Migration
  def change
    add_index :results, :check_id
    add_index :results, :successful
    add_index :results, [:check_id, :successful, :created_at]
  end
end
