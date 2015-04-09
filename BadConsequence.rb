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

	#Metodo de clase utilizado como "constructor" al que pasamos como parametros el nombre, el número de niveles y el número de tesoros
	#visibles e invisibles que quita
	def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisible, nHidden)
		new(text,levels, nVisible, nHidden, false, Array.new, Array.new)
	end

	#Metodo de clase utilizado como "constructor" al que pasamos como parametro el nombre
	#Siempre implica la muerte
	def BadConsequence.newDeath(txt)
		new(txt, -1, -1, -1, true, Array.new, Array.new)
	end

	#Metodo de clase utilizado como "constructor" al que pasamos como parametros el nombre, el número de niveles y los Arrays de tesoros
	#especificos que queremos quitar, tanto visibles como invisibles.
	def BadConsequence.newLevelSpecificTreasures(txt, level, sVisibleTreasures, sHiddenTreasures)
		new(txt, level, -1, -1, false, sVisibleTreasures, sHiddenTreasures)
	end

	#Metodo que devuelve true si el mal rollo esta vacío, entendiendo que mal rollo esta vacío cuando no implica ni perdida de niveles,
	#ni perdida de tesoros
	def isEmpty
		empty = false
		if(levels == -1 && nVisibleTreasures == -1 && nHiddenTreasures == -1 && death == false &&
			specificVisibleTreasures.empty? == true && specificHiddenTreasures.empty? == true )
			empty = true
		end

		return empty
	end

	#Metodo que devuelve true cuando el mal rollo implica la muerte, y false en caso contrario
	def kills
		return death
	end


	def substractVisibleTreasure(t)
	end

	def substractHiddenTreasure(t)
	end

	def adjustToFitTreasureLists(v, h)
	end

	#Metodo to_s devuelve un string con todos los atributos del mal rollo 
	def to_s
		if(levels == -1)
			nivel = "No quita niveles"
		else
			nivel = levels.to_s
		end

		if(death)
			muerto = "true";
		else
			muerto = "false";
		end

		tesorosVisibles = ""
		for i in 0 .. @specificVisibleTreasures.length
			tesorosVisibles += @specificVisibleTreasures[i].to_s+ " "
		end

		tesorosOcultos = ""
		for i in 0 .. @specificHiddenTreasures.length
			tesorosOcultos += @specificHiddenTreasures[i].to_s + " "
		end

		if(@nVisibleTreasures == -1)
			nVisible_string = "No utiliza número tesoros visibles"
		else
			nVisible_string = @nVisibleTreasures.to_s
		end

		if(@nHiddenTreasures == -1)
			nHidden_string = "No utiliza número tesoros visibles"
		else
			nHidden_string = @nHiddenTreasures.to_s
		end

		"\nTexto: " + @text + "\nNiveles: " + nivel + "\nNumero tesoros visibles: " + nVisible_string + "\nNumero tesoros ocultos: " + nHidden_string +
		"\nMuerte: " + muerto + "\nTesoros visibles especificos: " + tesorosVisibles + "\nTesoros ocultos especificos: " + tesorosOcultos
	end

	private_class_method :new

end

#Pruebas
#malRollito = BadConsequence.newLevelNumberOfTreasures("",-1,-1,-1)
#malRollito1 = BadConsequence.newDeath("")
#if malRollito.isEmpty
#	puts "El mal rollito esta vacio"
#end

#if malRollito1.kills
#	puts "El mal rollito 1 te mata"
#end

#Pruebas
	

#bc = BadConsequence.newDeath('a')
#bc1 = BadConsequence.newLevelNumberOfTreasures('ey', -1, -1, -1)
#bc2 = BadConsequence.newLevelSpecificTreasures('e', -1, Array.new, Array.new)

#@malRollitos = Array.new
#malRollitos = [malRollito, bc, bc1, bc2]

#for badconsequence in malRollitos
	#if badconsequence.isEmpty
		#puts "Toy vacio" + badconsequence.to_s + "\n"
#end

	#if badconsequence.kills
		#puts "Hay muerte" +badconsequence.to_s + "\n"
	#end
#end

end 
