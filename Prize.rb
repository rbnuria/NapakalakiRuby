require_relative 'TreasureKind.rb'
module NapakalakiRuby
class Prize

	def initialize(treasures,levels)
		@treasures=treasures
		@levels=levels
	end

	attr_reader :levels, :treasures  

	def to_s
		"\nTesoros: "+ @treasures.to_s + "\nNiveles:" + @levels.to_s
	end
end	
end