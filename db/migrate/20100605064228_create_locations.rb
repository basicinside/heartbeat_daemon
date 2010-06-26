class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :plz
      t.references :province

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
