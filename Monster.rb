module ...
class Monster
	def initialize(name,level,bc,prize)
		@name=name
		@combatLevel=level
		@badConsequence=bc
		@prize=prize
	end

	attr_reader :name, :level, :badConsequence, :prize
	
	def to_s
		"\nName:" +  @name + "\nCombatLevel: "+ @level.to_s + "\nBadConsequence:" + @badConsequence.to_s + "\nPrize" + @prize.to_s
	end

end