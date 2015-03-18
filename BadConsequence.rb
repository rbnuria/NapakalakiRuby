
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
module NapakalakiRuby
class BadConsequence

	attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

	def initialize(txt, level, nVisible, nHidden, death, sVisibleTreasures, sHiddenTreasures)
		@text = txt
		@levels = level
		@nVisibleTreasures = nVisible
		@nHiddenTreasures = nHidden
		@death = death
		@specificHiddenTreasures = sHiddenTreasures
		@specificVisibleTreasures = sVisibleTreasures
	end

	def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisible, nHidden)
		new(text,levels, nVisible, nHidden, false, Array.new, Array.new)
	end

	def BadConsequence.newDeath(txt)
		new(txt, -1, -1, -1, true, Array.new, Array.new)
	end

	def BadConsequence.newLevelSpecificTreasures(txt, level, sVisibleTreasures, sHiddenTreasures)
		new(txt, level, -1, -1, false, sVisibleTreasures, sHiddenTreasures)
	end


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
end
end 
