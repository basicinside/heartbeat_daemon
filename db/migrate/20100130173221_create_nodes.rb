class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.string :name
      t.string :node_id
      t.decimal :lat
      t.decimal :lon
      t.string :version
			t.text :uci
			t.date :last_seen
      
     	t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

			
			t.references :user
			t.references :device

      t.timestamps
    end
  end

  def self.down
    drop_table :nodes
  end
end
