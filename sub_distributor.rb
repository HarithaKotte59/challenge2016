class SubDistributor

	include DistributionHelper

	attr_accessor :excluded_cities

	#first augument should be an object of the parent class
	def initialize(distributor, restrictions)
		@distributor = distributor
		@included_cities = get_cities_from_place(restrictions[:included_places])
		excluded_cities = get_cities_from_place(restrictions[:excluded_places])
		@excluded_cities = @distributor.excluded_cities | excluded_cities
	end

	def valid_distributor(place)
		place = place.downcase
		valid = (@included_cities.include? place) && !(@excluded_cities.include? place)
		@distributor.valid_distributor(place) && valid
	end
end