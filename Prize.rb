require_relative 'TreasureKind.rb'
module Model
class Prize

	#Metodo initialize de la clase Prize
	def initialize(treasures,levels)
		@treasures=treasures
		@levels=levels
	end

	#Número de niveles que ganas si se te aplica
	attr_reader :levels
	#Número de tesoros que ganas si se te aplica
	attr_reader :treasures  

	def getLevels
		@levels
	end

	def getTreasures
		@treasures
	end	

	#Método que devuelve un string con todos los atributos
	def to_s
		"\n\tTesoros: "+ @treasures.to_s + "\n\tNiveles:" + @levels.to_s
	end
end	
end
