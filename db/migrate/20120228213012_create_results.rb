class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :check_id
      t.boolean :successful
      t.text :output
      t.timestamps
    end
  end
end
