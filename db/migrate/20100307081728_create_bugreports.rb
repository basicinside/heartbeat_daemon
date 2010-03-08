class CreateBugreports < ActiveRecord::Migration
  def self.up
    create_table :bugreports do |t|
      t.string :name
      t.string :version
      t.references :hardware
      t.text :beschreibung
      t.text :uci
      t.timestamps
    end
  end

  def self.down
    drop_table :bugreports
  end
end
