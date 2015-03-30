require_relative 'TreasureKind.rb'
module NapakalakiRuby
class Treasure
	def initialize(name, coins, min, max, t)
		@name = name
		@goldCoins = coins
		@minBonus = min
		@maxBonus = max
		@type = t
	end

	attr_reader :name, :goldCoins, :minBonus, :maxBonus, :type

end
end