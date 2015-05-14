#encoding: utf-8
require_relative 'BadConsequence.rb'

module Model
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
end