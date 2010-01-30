class CreateLandesverbands < ActiveRecord::Migration
  def self.up
    create_table :landesverbands do |t|
      t.string :name
      t.text :decription
      t.string :homepage
      t.references :partei

      t.timestamps
    end
  end

  def self.down
    drop_table :landesverbands
  end
end
