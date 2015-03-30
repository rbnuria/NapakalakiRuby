#encoding: utf-8
require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
require_relative 'Dice.rb'
require_relative 'CardDealer.rb'
require_relative 'CombatResult.rb'
module NapakalakiRuby
class Player

	@@MAXHIDDENTREASURES = 4

	def initialize(name)
		@name = name
		@dead = true 
		@level = 1

		#referencias
		@hiddenTreasures = Array.new
		@visibleTreasures = Array.new	
		@pendingBadConsequence = nil	
	end

	private
	def bringToLive
		@dead=false
	end

	def incrementLevels(l)
		@level=@level+l
		if @level>10
			@level=10
		end
	end

	def decrementLevels(l)
		@level=@level -l
		if @level<1
			@level=1
		end
	end

	def setPendingBadConsequence(b)
		@pendingBadConsequence=b
	end

	def die
	end

	def discardNecklaceIfVisible
	end

	def dieIfNoTreasures
		if @hiddenTreasures.empty? && @visibleTreasures.empty?
			@dead=true
		end
	end

	def canIBuyLevels(l)
		if (@level+l)<10
			true
		else
			false
		end
	end

	protected
	def computeGoldCoinsValue(t)
	end

	public
	def applyPrize(p)
	end

	def combat(m)
	end

	def applyBadConsequence(bad)
	end
	def getCombatLevel
		#vemos si esta equipado el collar y devolvemos una puntuacion u otra 
		puntuacionMax=0
		puntuacionMin=0
		encontrado=false
		for tesoro in @visibleTreasures
			if tesoro.getType==TreasureKind::NECKLACE
				encontrado=true				
			end
			puntuacionMin=puntuacionMin+tesoro.getMinBonus
			puntuacionMax=puntuacionMax+tesoro.getMaxBonus
		end
		if encontrado==true
			return puntuacionMax
		else
			puntuacionMin
		end
	end
	def makeTreasureVisible(t)
	end

	def canMakeTreasureVisible(t)
	end

	def discardVisibleTreasure(t)
	end

	def discardHiddenTreasure(t)
	end

	def buyLevels(visible, hidden)
	end

	attr_reader :level, :visibleTreasures, :hiddenTreasures

	def validState
		if @pendingBadConsequence==nil && @hiddenTreasures.length<5
			true
		else
			false
		end

	end

	def initTreasures
	end

	def isDead
		@dead
	end

	def hasVisibleTreasures
		if @visibleTreasures.empty?
			false
		else
			true
		end
	end
end
class Main
	
	player=Player.new('david')
	player.bringToLive
	player.incrementLevels(3)
	if player.hasVisibleTreasures
		puts 'no tienes tesoros visibles'
	else
		puts 'tienes tesoros visibles'
	end
end

end