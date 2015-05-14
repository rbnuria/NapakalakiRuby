module Model
class Cultist
	def initialize(name,gained)
		@name = name
		@gainedLevels = gained
	end

	def getBasicValue
		@gainedLevels
	end

	def getSpecialValue
		(@gainedLevels*CultistPlayer.getCultistPlayers)
	end

end
end