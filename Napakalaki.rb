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
		CombatResult=@currentPlayer.combat(@currentMonster)
		dealer=CardDealer.getInstance
		dealer.giveMonsterBack(@currentMonster)
		CombatResult
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
		dealer=CardDealer.getInstance
		dealer.initCards
		self.initPlayers(names)
		self.nextTurn
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
	attr_reader :VisibleTreasures
	attr_reader :HiddenTreasures
	

	def nextTurn
		stateOK=self.nextTurnIsAllowed
		if estateOK
			dealer=CardDealer.getInstance
			@currentMonster=dealer.nextMonster
			@currentPlayer=self.nextPlayer
			dead=@currentPlayer.isDead
			if dead
				@currentPlayer.initTreasures
			end
		end
		stateOK
	end

	def nextTurnIsAllowed
		if @currentPlayer==-1
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