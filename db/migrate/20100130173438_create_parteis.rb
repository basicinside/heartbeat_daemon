class CreateParteis < ActiveRecord::Migration
  def self.up
    create_table :parteis do |t|
      t.string :name
      t.text :decription
      t.string :homepage

      t.timestamps
    end
    
    #create pirate party entry on migration
		ppd = Partei.new
		ppd.name = 'Piratenpartei Deutschland'
		ppd.id = 1
		ppd.save
		puts "create Partei 'Piratenpartei Deutschland'"
  end

  def self.down
    drop_table :parteis
  end
end
