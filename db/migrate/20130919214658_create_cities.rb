class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :country, index: true
      t.references :region, index: true
      t.string :name
      t.float :latitude
      t.float :longitude
    end

    add_index "cities", ["name"], name: "index_cities_on_name"
    add_index "cities", ["country_id", "name"], name: "index_cities_on_country_id_and_name"
    add_index "cities", ["region_id", "name"], name: "index_cities_on_region_id_and_name"
  end
end
