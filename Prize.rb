
require_relative 'TreasureKind.rb'
module NapakalakiRuby
class Prize

	def initialize(treasures,levels)
		@treasures=treasures
		@levels=levels
	end

	attr_reader :levels, :treasures  

	def to_s
		"\nTreasures: "+ @treasures.to_s + "\nLevels :" + @levels.to_s
	end
end	
end