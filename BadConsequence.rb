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
		"\n\tEsto es un mal rollo con el siguiente contenido: \n"
	end

	private_class_method :new

end

class BadConsequenceNumbers < BadConsequence
	def initialize(text, levels, nVisible, nHidden)
		super(text,levels, nVisible, nHidden, false, Array.new, Array.new)
	end

	def isEmpty
		if(@levels == 0 && @nVisibleTreasures == 0 && @nHiddenTreasures == 0)
			return true 
		else
			return false
		end
	end

	def substractVisibleTreasure(t)
		if @nVisibleTreasures > 0
        	@nVisibleTreasures = @nVisibleTreasures - 1
        end
	end

	def substractHiddenTreasure(t)
		if @nHiddenTreasures > 0
        	@nHiddenTreasures = @nHiddenTreasures - 1
        end
	end


	def adjustToFitTreasureLists(v, h)
		nvisible = @nVisibleTreasures
		nhidden = @nHiddenTreasures

		if v.length < @nVisibleTreasures
	        nvisible = v.length
	    end
	      
	    if h.length < @nHiddenTreasures
	        nhidden = h.length
	    end

	  	nuevobc = BadConsequenceNumbers.new(@text, 0, nvisible, nhidden)

	  	return nuevobc

	end

	def to_s
		if(@levels == 0)
			nivel = "No quita niveles"
		else
			nivel = levels.to_s
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

		salida = super
		salida += "\n\tTexto: " + @text + "\n\tNiveles: " + nivel + "\n\tNumero tesoros visibles: " + nVisible_string + "\n\tNumero tesoros ocultos: " + nHidden_string 
		
		return salida	

	end

	public_class_method :new


end

class BadConsequenceSpecific < BadConsequence
	def initialize(txt, level, sVisibleTreasures, sHiddenTreasures)
		super(txt, level, 0, 0, false, sVisibleTreasures, sHiddenTreasures)
	end

	def isEmpty
		if (@specificVisibleTreasures.empty? == true && @specificHiddenTreasures.empty? == true )
			return true
		else 
			return false
		end
	end

	def substractVisibleTreasure(t)
		tipo = @specificVisibleTreasures.find_index(t.type)
        if tipo != nil
          @specificVisibleTreasures.delete_at(tipo)
        end
	end

	def substractHiddenTreasure(t)
		tipo = @specificHiddenTreasures.find_index(t.type)
        if tipo != nil
          @specificHiddenTreasures.delete_at(tipo)
        end
	end

	def adjustToFitTreasureLists(v, h)
		i=0
		copiavisible = @specificVisibleTreasures
		copiahidden = @specificHiddenTreasures

		tVisible=Array.new
		tHidden=Array.new

		while i < v.length
		  if copiavisible.include?(v[i].type)
		    tVisible << v[i].type
		  end
		  i=i+1
		end

		i=0
		while i < h.length
		  if copiahidden.include?(h[i].type)
		    tHidden << h[i].type
		  end
		  i=i+1
		end
		  
		nuevobc = BadConsequenceSpecific.new(@text,0,tVisible,tHidden)

		return nuevobc
	end


	def to_s
		
		tesorosVisibles = ""
		for i in 0 .. @specificVisibleTreasures.length
			tesorosVisibles += @specificVisibleTreasures[i].to_s+ " "
		end

		tesorosOcultos = ""
		for i in 0 .. @specificHiddenTreasures.length
			tesorosOcultos += @specificHiddenTreasures[i].to_s + " "
		end

		salida = super
		salida += "\n\tTexto: " + @text + "\n\tTesoros visibles especificos: " + tesorosVisibles + "\n\tTesoros ocultos especificos: " + tesorosOcultos 

		return salida
	
	
	end
	
	public_class_method :new
end

class BadConsequenceDeath < BadConsequence
	def initialize(txt)
		super(txt, 0, 0, 0, true, Array.new, Array.new)
	end

	def isEmpty
		true
	end

	def to_s
		if(@death)
			muerto = "true";
		else
			muerto = "false";
		end

		salida = super
		salida += "\n\tTexto: " + @text + "\n\tMuerte: " + muerto

		return salida

	end

	def adjustToFitTreasureLists
		return BadConsequenceDeath.new(@text)
	end

	public_class_method :new

end

end 

