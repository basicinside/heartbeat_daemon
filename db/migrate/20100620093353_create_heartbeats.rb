class CreateHeartbeats < ActiveRecord::Migration
  def self.up
    create_table :heartbeats do |t|
      t.date :date
      t.references :node
      t.integer :neighbors
      t.integer :clients

      t.timestamps
    end
  end

  def self.down
    drop_table :heartbeats
  end
end
