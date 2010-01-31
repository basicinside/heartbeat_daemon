class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.string :name
      t.string :node_id
      t.decimal :lat
      t.decimal :lon
      t.references :crew
      t.string :rev
      t.integer :clients_count
      t.integer :neighboors_count

      t.timestamps
    end
  end

  def self.down
    drop_table :nodes
  end
end
