class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
			t.references :node
    	t.string :data_file_name
    	t.string :data_content_type
    	t.integer :data_file_size
    	t.datetime :data_updated_at

      t.timestamps
    end
		add_index :photos, :node_id
  end

  def self.down
    drop_table :photos
  end
end
