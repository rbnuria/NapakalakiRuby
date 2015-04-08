#encoding: utf-8
require_relative 'Napakalaki.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require 'singleton'
module NapakalakiRuby     
class Napakalaki
include Singleton
	
	#Metodo initialize de la clase Napakalaki
	def initialize 
		@currentMonster=Monster.new
		@currentPlayers=Player.new
		@players = Array.new
	end	

	private
	def initPlayers(names)
	end

	def nextPlayer
	end

	public 
	

	def combat
	end

	def discardVisibleTreasure(t)
	end

	def discardHiddenTreasure(t)
	end

	def makeTreasureVisible(t)
	end

	def buyLevels(visible,hidden)
	end

	def initGame(players)
	end

	def getCurrentPlayer
	end

	def getCurrentMonster
	end

	def canMakeTreasureVisible(t)
	end

	def getVisibleTreasures
	end

	def getHiddenTreasures
	end

	def nextTurn
	end

	def nextTurnAllowed
	end

	def endOfGame(result)
	end
end
end