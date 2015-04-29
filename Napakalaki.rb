#encoding: utf-8
require_relative 'Napakalaki.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require 'singleton'
module Model     
class Napakalaki
include Singleton
	
	#Metodo initialize de la clase Napakalaki
	def initialize 
		@currentMonster=nil
		@currentPlayer = nil
		@players = Array.new
		@currentPlayersIndex=-1
	end	

	private
	def initPlayers(names)
		for n in names
			@players<<Player.new(n)
		end		
	end

	def nextPlayer
		if @currentPlayersIndex == -1
			@currentPlayersIndex=rand(@players.length-1)
		else
			@currentPlayersIndex=(@currentPlayersIndex+1) % @players.length
		end
		@currentPlayer=@players.at(@currentPlayersIndex)
	end

	public 
	
	

	def combat
		combatResult=@currentPlayer.combat(@currentMonster)
		dealer=CardDealer.instance
		dealer.giveMonsterBack(@currentMonster)
		combatResult
	end

	def discardVisibleTreasure(t)
		
		@currentPlayer.discardVisibleTreasure(t)	
		
		
	end

	def discardHiddenTreasure(t)
		
		@currentPlayer.discardHiddenTreasure(t)			
		
	end

	def makeTreasureVisible(t)
		canI=self.canMakeTreasureVisible(t)
		if canI
			@currentPlayer.makeTreasureVisible(t)
		end
		canI
	end

	def buyLevels(visible,hidden)
		canI=@currentPlayer.buyLevels(visible,hidden)
		canI
	end

	def initGame(names)
		dealer=CardDealer.instance
		dealer.initCards
		initPlayers(names)
		nextTurn
	end

	def getCurrentPlayer
		@currentPlayer
	end

	def getCurrentMonster
		@currentMonster
	end

	def canMakeTreasureVisible(t)
		@currentPlayer.canMakeTreasureVisible(t)
	end

	def nextTurn
		stateOK=nextTurnIsAllowed
		if stateOK
			dealer=CardDealer.instance
			@currentMonster=dealer.nextMonster
			@currentPlayer=nextPlayer
			dead=@currentPlayer.isDead
			if dead
				@currentPlayer.initTreasures
			end
		end
		stateOK
	end

	def nextTurnIsAllowed
		if @currentPlayersIndex==-1
			return true
		else
			return @currentPlayer.validState
		end
	end

	def endOfGame(result)
		if result==CombatResult::WINANDWINGAME
			true
		else
			false
		end
	end
end
end