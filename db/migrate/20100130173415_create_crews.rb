class CreateCrews < ActiveRecord::Migration
  def self.up
    create_table :crews do |t|
      t.string :name
      t.text :decription
      t.string :homepage
      t.references :landesverband

      t.timestamps
    end
  end

  def self.down
    drop_table :crews
  end
end
