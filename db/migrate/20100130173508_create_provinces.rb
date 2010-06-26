class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :name
      t.text :description
      t.string :homepage
      t.references :country

      t.timestamps
    end
		germany = Country.find_by_name "Deutschland"
		german_provinces = ["Baden-WÃ¼rttember", "Bayern", "Berlin", "Brandenburg",
			"Bremen", "Hamburg", "Hessen", "Mecklenburg-Vorpommern", "Niedersachsen",
			"Nordrhein-Westfalen", "Rheinland-Pfalz", "Saarland", "Sachsen",
			"Sachsen-Anhalt", "Schleswig-Holstein", "ThÃringen" ]
		german_provinces.each { |province| Province.new(:name => province, :country_id => germany.id).save }
  end

  def self.down
    drop_table :provinces
  end
end
