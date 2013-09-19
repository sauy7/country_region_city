class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.references :country, index: true
      t.string :name
    end

    add_index "regions", ["country_id", "name"], :name => "index_regions_on_country_id_and_name"
  end
end
