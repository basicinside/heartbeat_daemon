class CreateParteis < ActiveRecord::Migration
  def self.up
    create_table :parteis do |t|
      t.string :name
      t.text :decription
      t.string :homepage

      t.timestamps
    end
  end

  def self.down
    drop_table :parteis
  end
end
