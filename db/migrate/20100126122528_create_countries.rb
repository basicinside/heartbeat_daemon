class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

		Country.new(:name => 'Deutschland').save
  end

  def self.down
    drop_table :countries
  end
end
