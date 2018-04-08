require 'csv'
module DistributionHelper

	ALL_CITIES = []
	CSV.foreach(File.path("cities.csv"),headers: true) do |row|
		ALL_CITIES << row
	end

	def get_cities_from_place(places)
		cities = []
		if !places.nil?
			places.each do |place|
				case place.length
				when 3
					filter_key = place[2]
					cities << place[2]
				when 2
					filter_key = place[1]
					cities_row = ALL_CITIES.reject{|x|  x['Province Code'] != filter_key}
					cities |= cities_row.map{|x| "#{x['City Code'].downcase}-#{x['Province Code'].downcase}-#{x['Country Code'].downcase}"}
				when 1
					filter_key = place[0]
					cities_row = ALL_CITIES.reject{|x|  x['Country Code'] != filter_key}
					cities |= cities_row.map{|x| "#{x['City Code'].downcase}-#{x['Province Code'].downcase}-#{x['Country Code'].downcase}"}
				end
			end
		end
		return cities
	end
end
