#encoding: utf-8
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

	def getMinBonus
		@minBonus
	end

	def getMaxBonus
		@maxBonus
	end

	def getType
		@type
	end
	
	def to_s
		"Nombre: " + @name.to_s + "\n\tNúmero de monedas de oro: " + @goldCoins.to_s + "\n\tNiveles que suma sin collar: " + @minBonus.to_s + "\n\tNiveles que suma con collar: " + @maxBonus.to_s +
		"\n\tTipo de tesoro: "  + @type.to_s + "\n"
	end

end
end
