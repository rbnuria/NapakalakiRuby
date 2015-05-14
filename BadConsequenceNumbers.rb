#encoding: utf-8
require_relative 'BadConsequence.rb'

module Model
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
end