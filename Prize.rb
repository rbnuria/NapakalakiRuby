module ...
class Prize

	def initialize(treasures,levels)
		@treasures=treasures
		@levels=levels
	end

	attr_reader :levels, :treasures  

	def to_s
		puts "\nTreasures: "+ @treasures.to_s + "\nLevels :" @levels.to_s
	end
end	