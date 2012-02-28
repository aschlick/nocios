class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :command
      t.integer :host_id
      t.integer :frequency
      t.integer :keep_for
      t.timestamps
    end
  end
end
