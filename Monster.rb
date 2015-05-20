#encoding: utf-8
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
module Model
class Monster
	#Metodo initialize de la clase Monster
	def initialize(name,level,prize,bc,lc)
		@name=name
		@combatLevel=level
		@prize=prize
		@badConsequence=bc
		@levelChangeAgainstCultistPlayer=lc
	end

	#Nombre del monstruo
	attr_reader :name
	#Nivel con el que combate
	attr_reader :combatLevel
	#Premio que ganamos si le ganamos el combate
	attr_reader :prize
	#Mal rollo que se nos aplica si perdemos el combate
	attr_reader :badConsequence

	def getLevel
		@combatLevel
	end

	def getBadConsequence
		@badConsequence
	end

	def getPrize
		@prize
	end
	
	#Metodo que devuelve un string con todos los atributos de la clase Monster
	def to_s
		"\nNombre:" +  @name + "\nNivel de combate: "+ @combatLevel.to_s + "\nMal Rollo: " + @badConsequence.to_s + "\nBuen Rollo" + @prize.to_s
	end

	def getBasicValue
		return @combatLevel
	end

	def getSpecialValue
		return (@level + @levelChangeAgainstCultistPlayer)
	end





end
end