class CreateAntennas < ActiveRecord::Migration
  def self.up
    create_table :antennas do |t|
      t.string :name
      t.string :vendor
      t.string :polarity
      t.string :type
      t.integer :height
      t.integer :direction
      t.integer :gain
      t.integer :angle_horizontal
      t.integer :angle_vertical

      t.timestamps
    end
  end

  def self.down
    drop_table :antennas
  end
end
