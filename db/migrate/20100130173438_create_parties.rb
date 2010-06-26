class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.string :homepage

      t.timestamps
    end
    
    #create pirate party entry on migration
		ppd = Party.new
		ppd.name = 'Piratenpartei Deutschland'
		ppd.id = 1
		ppd.save
		puts "create Partei 'Piratenpartei Deutschland'"
  end

  def self.down
    drop_table :parties
  end
end
