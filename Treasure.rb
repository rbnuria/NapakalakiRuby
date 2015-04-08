require_relative 'TreasureKind.rb'
module Model
class Treasure
	#Metodo initialize de la clase Treasure
	def initialize(name, coins, min, max, t)
		@name = name
		@goldCoins = coins
		@minBonus = min
		@maxBonus = max
		@type = t
	end

	#Nombre del tesoro
	attr_reader :name
	#Número de monedas de oro
	attr_reader :goldCoins
	#Niveles que te suma si no tienes el collar
	attr_reader :minBonus
	#Niveles que te suma si tienes el collar
	attr_reader :maxBonus
	#Tipo de tesoro
	attr_reader :type

end
end