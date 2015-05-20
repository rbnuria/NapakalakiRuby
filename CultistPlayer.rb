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

	public
	#Volver a hacer PROTECTEEEED
	def shouldConvert()
		false
	end

	public
	#VOLVER A HACERLO PROTECTEEED!!!!!

	def computeGoldCoinsValue(t)
		value = 0
		for treasure in t
			value = value + treasure.goldCoins
		end
		return value*2
	end

	public 
	def getCombatLevel
		level = super 
		level = level + @myCultistCard.getSpecialValue
		return level
	end

	def to_s
		salida = super
		salida += "\n\tJugador sectario"
	end


	



end
end
