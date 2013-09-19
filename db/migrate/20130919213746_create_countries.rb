class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
    end

    add_index "countries", ["name"], :name => "index_countries_on_name"
  end
end
