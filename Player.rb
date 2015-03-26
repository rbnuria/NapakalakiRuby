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
		@setPendingBadConsequence =BadConsequence.new
	end

	private
	def bringToLive
	end

	def incrementLevels(l)
	end

	def decrementLevels(l)
	end

	def setPendingBadConsequence(b)
	end

	def die
	end

	def discardNecklaceIfVisible
	end

	def dieIfNoTreasures
	end

	def canIBuyLevels(l)
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
	end

	def initTreasures
	end

	def isDead
	end

	def hasVisibleTreasures
	end











end