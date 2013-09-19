require 'csv'

conn = ActiveRecord::Base.connection_pool.checkout
rc = conn.raw_connection
sql = %Q(COPY countries (id, code, name) FROM STDIN DELIMITER ',' CSV)
rc.exec sql
CSV.foreach File.join(File.dirname(__FILE__), "countries.csv") do |row|
  line = %Q(#{row[0]},"#{row[1]}","#{row[2]}"\n)
  rc.put_copy_data line
end
rc.put_copy_end

sql = %Q(COPY regions (id, country_id, name) FROM STDIN DELIMITER ',' CSV)
rc.exec sql
CSV.foreach File.join(File.dirname(__FILE__), "regions.csv") do |row|
  line = %Q(#{row[0]},"#{row[1]}","#{row[2]}"\n)
  rc.put_copy_data line
end
rc.put_copy_end

sql = %Q(COPY cities (id, country_id, region_id, name, latitude, longitude) FROM STDIN DELIMITER ',' CSV)
rc.exec sql
CSV.foreach File.join(File.dirname(__FILE__), "cities.csv") do |row|
  line = %Q(#{row[0]},#{row[1]},#{row[2]},"#{row[3]}",#{row[4]},#{row[5]}\n)
  rc.put_copy_data line
end
rc.put_copy_end

while res = rc.get_result do; end
ActiveRecord::Base.connection_pool.checkin(conn)
