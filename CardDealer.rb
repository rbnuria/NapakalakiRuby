require 'singleton'
require_relative 'treasure_kind.rb'
require_relative 'cultist.rb'

module NapakalakiRuby

class CardDealer
include Singleton

def initialize
	@unusedMonsters=Array.new
	@usedMonsters = Array.new
	@usedTreasures = Array.new
	@unusedTreasures = Array.new

end

def initTreasureCardDeck
end

def initMonsterCardDeck

end

def shuffleMonters
end

public
def nextTreasure
end

def nextMonster
end

def giveTreasureBack(t)
end

def giveMonsterBack(m)
end

def initCards
	
end



