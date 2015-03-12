module ...
class BadConsequence

	attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

	def initialize(text, levels, nVisibleTreasures, nHiddenTreasures, death, specificVisibleTreasures, specificHiddenTreasures)
		@text = text
		@levels = levels
		@nVisibleTreasures = nVisibleTreasures
		@nHiddenTreasures = nHiddenTreasures
		@death = death
		@specificHiddenTreasures = specificHiddenTreasures
		@specificVisibleTreasures = specificVisibleTreasures
	end

	def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisibleTreasures, nHiddenTreasures)
		new(text,levels, nVisibleTreasures, nHiddenTreasures, false, Array.new, Array.new)
	end

	def BadConsequence.newDeath(text)
		new(text, -1, -1, -1, true, Array.new, Array,new)
	end

	def BadConsequence.newLevelSpecificTreasures(text, levels, specificVisibleTreasures, specificHiddenTreasures)
		new(text, levels, -1, -1, false, specificVisibleTreasures, specificHiddenTreasures)
	end


	def to_s
		if(death)
			muerto = "true";
		else
			muerto = "false";
		end

		tesorosVisibles = ""
		for i in 0 .. specificVisibleTreasures.length
			tesorosVisibles += specificVisibleTreasures[i]
		end

		tesorosOcultos = ""
		for i in 0 .. specificHiddenTreasures.length
			tesorosOcultos += specificHiddenTreasures[i]
		end

		"\nText: " + @text + "\nLevels: " + @levels.to_s + "\nnVisibleTreasures: " + @nVisibleTreasures.to_s + "\nnHiddenTreasures: " + @nHiddenTreasures.to_s +
		"\nDeath : " + muerto + "\nSpecificVisibleTreasures: " + tesorosVisibles + "\nSpecificHiddenTreasures: " + tesorosOcultos
	end
end
