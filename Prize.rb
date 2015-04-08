require_relative 'TreasureKind.rb'
module NapakalakiRuby
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

	#Método que devuelve un string con todos los atributos
	def to_s
		"\nTesoros: "+ @treasures.to_s + "\nNiveles:" + @levels.to_s
	end
end	
end