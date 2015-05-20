#encoding: utf-8
require_relative 'Cultist.rb'
require_relative 'Player.rb'
module Model
class CultistPlayer < Player
	@@totalCultistPlayers = 0

	def initialize(player,cultist)
		newCopia(player)
		@myCultistCard = cultist
		@@totalCultistPlayers =@@totalCultistPlayers + 1
	end

	def self.getCultistPlayers
		@@totalCultistPlayers
	end

	protected
	def getOponentLevel(monster)
		monster.getSpecialValue
	end

	def shouldConvert()
		false
	end

	def computeGoldCoinsValue(t)
		value = 0
		for treasure in t
			value = value + treasure.goldCoins
		end
		return value*2
	end

	public 
	def getCombatLevel
		level = super + @myCultistCard.getSpecialValue
		return level
	end

	def to_s
		salida = super
		salida += "\nJugador sectario"
	end


	



end
end
