class Distributor

	include DistributionHelper

	attr_accessor :excluded_cities

=begin

'included_places' and 'excluded_places' in 'restrictions' must be in the order of ['Country Code', 'Province Code', 'City Code'] 
everything is optional in the array but not the order. 
If you want to provide the city, it must be [country,state,city], 
if state, it must be [country,state] and 
if only country, it should be [country] and 
They can be an empty array also which means that respective param contains all the possible list of countries

=end

	def initialize(restrictions)
		@included_cities = get_cities_from_place(restrictions[:included_places])
		@excluded_cities = get_cities_from_place(restrictions[:excluded_places])
	end

	def valid_distributor(place) #Always give 'City Code' as param to check the distributor access(Assuming 'City Code' is unique)
		place = place.downcase
		valid = (@included_cities.include? place) && !(@excluded_cities.include? place)
	end  
end
