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
		@currentMonster=Monster.new
		@currentPlayer=Player.new
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
		@currentPlayer
	end

	def getCurrentMonster
		@currentMonster
	end

	def canMakeTreasureVisible(t)
	end

	def getVisibleTreasures
	end

	def getHiddenTreasures
	end

	def nextTurn
	end

	def nextTurnIsAllowed
		@currentPlayer.validState
	end

	def endOfGame(result)
		if result==CombatResult::WINANDWINGAME
			true
		else
			false
		end
	end
end
=begin
	jugador=Player.new("David")
	jug=Player.new("manolo")
	jugado=Player.new("lily")
	visibles=Array.new
	invisibles=Array.new
	visibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	visibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	visibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])	
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])
	invisibles<<Treasure.new('¡Si mi amo!', 0, 4,7, [TreasureKind::HELMET])

	jugador.setVisibleTreasureList(visibles)
	jugador.setHiddenTreasureList(invisibles)
	
	bc2 = BadConsequence.newLevelSpecificTreasures('e', -1, Array.new, Array.new)
	
	jugador.setPendingBadConsequence(bc2)
	prueba=Napakalaki.new
	jugadores=Array.new
	jugadores<<jugador
	jugadores<<jug
	jugadores<<jugado
	prueba.initPlayers(jugadores)
	prueba.nextPlayer
	if prueba.nextTurnIsAllowed
		prueba.nextPlayer
		puts "el siguiente esta permitido y es "
		puts prueba.getCurrentPlayer
	else
		puts "estado invalido"
	end
	if prueba.nextTurnIsAllowed
		prueba.nextPlayer
		puts "el siguiente esta permitido y es "
		puts prueba.getCurrentPlayer
	else
		puts "estado invalido"
	end
=end
end