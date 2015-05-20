#encoding: utf-8

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
		return (@gainedLevels*CultistPlayer.getCultistPlayers)
	end

	def to_s
    	return @name + "\n" + "niveles ganados: " + @gainedLevels.to_s
  	end
end
end