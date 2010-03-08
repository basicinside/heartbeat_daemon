class CreateHardwares < ActiveRecord::Migration
  def self.up
    create_table :hardwares do |t|
      t.string :name
      t.string :hersteller
      t.text :beschreibung
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :hardwares
  end
end
