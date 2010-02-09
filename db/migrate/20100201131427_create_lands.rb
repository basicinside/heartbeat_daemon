class CreateLands < ActiveRecord::Migration
  def self.up
    create_table :lands do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    #create pirate party entry on migration
		dt = Land.new
		dt.name = 'Deutschland'
		dt.id = 1
		dt.save
		puts "create Land 'Deutschland'"
  end

  def self.down
    drop_table :lands
  end
end
