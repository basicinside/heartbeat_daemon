class CreateBugreports < ActiveRecord::Migration
  def self.up
    create_table :bugreports do |t|
      t.string :name
      t.string :version
      t.string :hardware
      t.text :beschreibung

      t.timestamps
    end
  end

  def self.down
    drop_table :bugreports
  end
end
