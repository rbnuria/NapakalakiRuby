require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
module NapakalakiRuby
class Monster
	def initialize(name,level,prize,bc)
		@name=name
		@combatLevel=level
		@prize=prize
		@badConsequence=bc

	end

	attr_reader :name, :combatLevel, :prize, :badConsequence
	
	def to_s
		"\nName:" +  @name + "\nNivel de combate: "+ @combatLevel.to_s + "\nMal Rollo:" + @badConsequence.to_s + "\nBuen Rollo" + @prize.to_s
	end

end
end