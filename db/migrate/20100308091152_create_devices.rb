class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :name
      t.string :hersteller
      t.text :beschreibung
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
