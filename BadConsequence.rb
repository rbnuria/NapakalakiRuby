#encoding: utf-8
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
module Model
class BadConsequence
	

	#Nombre del mal rollo
	attr_reader :text
	#Niveles que quita el mal rollo
	attr_reader :levels 
	#Numero de tesoros visibles que quita el mal rollo
	attr_reader :nVisibleTreasures
	#Numero de tesoros invisibles que quita el mal rollo
	attr_reader :nHiddenTreasures
	#Condicional que indica si el mal rollo conlleva la muerte o no
	attr_reader :death
	#Array con los tesoros especificos visibles que quita el mal rollo
	attr_reader :specificVisibleTreasures
	#Array con los tesoros especificos invisibles que quita el mal rollo
	attr_reader :specificHiddenTreasures

	#Metodo initialize privado de la clase BadConsequence.rb 
	def initialize(txt, level, nVisible, nHidden, death, sVisibleTreasures, sHiddenTreasures)
		@text = txt
		@levels = level
		@nVisibleTreasures = nVisible
		@nHiddenTreasures = nHidden
		@death = death
		@specificHiddenTreasures = sHiddenTreasures
		@specificVisibleTreasures = sVisibleTreasures
	end

	def getLevels
		@levels
	end


	#Metodo que devuelve true si el mal rollo esta vacío, entendiendo que mal rollo esta vacío cuando no implica ni perdida de niveles,
	#ni perdida de tesoros
	def isEmpty
	end

	#Metodo que devuelve true cuando el mal rollo implica la muerte, y false en caso contrario
	def kills
		return @death
	end

	#Métodos sin implementar, métodos abstractos
    def substractVisibleTreasure(t)
    end

    def substractHiddenTreasure(t)
    end
	

	def adjustToFitTreasureLists(v, h)	
	end	

	#Metodo to_s devuelve un string con todos los atributos del mal rollo 
	def to_s
		"\nEsto es un mal rollo con el siguiente contenido: \n"
	end

	private_class_method :new

end
end 

