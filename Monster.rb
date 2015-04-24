#encoding: utf-8
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
module Model
class Monster
	#Metodo initialize de la clase Monster
	def initialize(name,level,prize,bc)
		@name=name
		@combatLevel=level
		@prize=prize
		@badConsequence=bc

	end

	#Nombre del monstruo
	attr_reader :name
	#Nivel con el que combate
	attr_reader :combatLevel
	#Premio que ganamos si le ganamos el combate
	attr_reader :prize
	#Mal rollo que se nos aplica si perdemos el combate
	attr_reader :badConsequence
	
	#Metodo que devuelve un string con todos los atributos de la clase Monster
	def to_s
		"\nName:" +  @name + "\n\tNivel de combate: "+ @combatLevel.to_s + "\n\tMal Rollo:" + @badConsequence.to_s + "\n\tBuen Rollo" + @prize.to_s
	end

end

end