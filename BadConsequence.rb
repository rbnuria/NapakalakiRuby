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

	#Metodo de clase utilizado como "constructor" al que pasamos como parametros el nombre, el número de niveles y el número de tesoros
	#visibles e invisibles que quita
	def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisible, nHidden)
		new(text,levels, nVisible, nHidden, false, Array.new, Array.new)
	end

	#Metodo de clase utilizado como "constructor" al que pasamos como parametro el nombre
	#Siempre implica la muerte
	def BadConsequence.newDeath(txt)
		new(txt, 0, 0, 0, true, Array.new, Array.new)
	end

	#Metodo de clase utilizado como "constructor" al que pasamos como parametros el nombre, el número de niveles y los Arrays de tesoros
	#especificos que queremos quitar, tanto visibles como invisibles.
	def BadConsequence.newLevelSpecificTreasures(txt, level, sVisibleTreasures, sHiddenTreasures)
		new(txt, level, 0, 0, false, sVisibleTreasures, sHiddenTreasures)
	end

	#Metodo que devuelve true si el mal rollo esta vacío, entendiendo que mal rollo esta vacío cuando no implica ni perdida de niveles,
	#ni perdida de tesoros
	def isEmpty
		empty = false
		if(@levels == 0 && @nVisibleTreasures <1 && @nHiddenTreasures < 1  &&
			@specificVisibleTreasures.empty? == true && @specificHiddenTreasures.empty? == true )
			empty = true
		end

		return empty
	end

	#Metodo que devuelve true cuando el mal rollo implica la muerte, y false en caso contrario
	def kills
		return @death
	end


	def substractVisibleTreasure(t)
		tipo = t.getType
		noencontrado = true
		for treasure in @specificVisibleTreasures
			if noencontrado
				if treasure.getType == tipo
					@specificVisibleTreasures.delete(tipo)
					noencontrado = false
				end
			end
			if !noencontrado
				break
			end
		end

		#Asi nos ahorramos el caso de que se quiten mas de la cuenta y sea negativo 
		if noencontrado && @nVisibleTreasures != 0
			@nVisibleTreasures = @nVisibleTreasures - 1
		end
	end

	def substractHiddenTreasure(t)
		tipo = t.getType
		noencontrado = true
		for treasure in @specificHiddenTreasures
			if noencontrado
				if treasure.getType == tipo
					@specificHiddenTreasures.delete(tipo)
					noencontrado = false
				end
			end
			if !noencontrado
				break
			end
		end
		if noencontrado && @nHiddenTreasures != 0
			@nHiddenTreasures = @nHiddenTreasures - 1
		end
	end
	

	def adjustToFitTreasureLists(v, h)
		tVisible=Array.new
		tHidden=Array.new
		nvisible = @nVisibleTreasures
		nhidden = @nHiddenTreasures
		i=0
		copiavisible = @specificVisibleTreasures
		copiahidden = @specificHiddenTreasures

		if (@specificHiddenTreasures.empty? == true) && (@specificVisibleTreasures.empty? == true)
		    if v.length < @nVisibleTreasures
		        nvisible = v.length
		    end
		      
		    if h.length < @nHiddenTreasures
		        nhidden = h.length
		    end
		     
		    nuevobc = BadConsequence.newLevelNumberOfTreasures(@text, 0, nvisible, nhidden)
		else
		while i < v.length
		  if copiavisible.include?(v[i].type)
		    tVisible << v[i].type
		    copiavisible.delete_at(copiavisible.index(v[i].type))
		  end
		  i=i+1
		end

		i=0
		while i < h.length
		  if copiahidden.include?(h[i].type)
		    tHidden << h[i].type
		    copiahidden.delete_at(copiahidden.index(h[i].type))
		  end
		  i=i+1
		end
		  nuevobc = BadConsequence.newLevelSpecificTreasures(@text,0,tVisible,tHidden)
		end

		return nuevobc

	end	

	#Metodo to_s devuelve un string con todos los atributos del mal rollo 
	def to_s
		if(@levels == 0)
			nivel = "No quita niveles"
		else
			nivel = levels.to_s
		end

		if(@death)
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

		if(@nVisibleTreasures == 0)
			nVisible_string = "No utiliza número tesoros visibles"
		else
			nVisible_string = @nVisibleTreasures.to_s
		end

		if(@nHiddenTreasures == 0)
			nHidden_string = "No utiliza número tesoros visibles"
		else
			nHidden_string = @nHiddenTreasures.to_s
		end

		"\n\tTexto: " + @text + "\n\tNiveles: " + nivel + "\n\tNumero tesoros visibles: " + nVisible_string + "\n\tNumero tesoros ocultos: " + nHidden_string +
		"\n\tMuerte: " + muerto + "\n\tTesoros visibles especificos: " + tesorosVisibles + "\n\tTesoros ocultos especificos: " + tesorosOcultos
	end

	private_class_method :new

end
end 

