#encoding: utf-8
require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
require_relative 'Dice.rb'
require_relative 'CardDealer.rb'
require_relative 'CombatResult.rb'
module Model
class Player
	

	#Atributo de clase que almacena el máximo número de tesoros ocultos que podemos almacenar
	@@MAXHIDDENTREASURES = 4
	@pendingBadConsequence

	#Metodo initialize de la clase Player
	def initialize(name)
		@name = name
		@dead = true
		@level = 1

		#referencias
		@hiddenTreasures = Array.new
		@visibleTreasures = Array.new	
		@pendingBadConsequence = nil
	end

	#Metodo privado que devuelve a la vida al jugador haciendo su atributo death falso
	private
	def bringToLive
		@dead=false
	end

	#Metodo que incrementa tu nivel actual en tantos niveles como le pasemos como parámetros
	#teniendo en cuenta que el máximo número de niveles es 10
	def incrementLevels(l)
		@level=@level+l
		if @level>10
			@level=10
		end
	end

	#Metodo que decrementa tu nivel actual en tantos niveles como le pasemos como parámetros
	#teniendo en cuenta que el mínimo número de niveles es 1
	def decrementLevels(l)
		@level=@level -l
		if @level<1
			@level=1
		end
	end


	#Metodo que asigna al atributo pendingBadConsequence el objeto pasado como argumento
	def setPendingBadConsequence(b)
		@pendingBadConsequence=b
	end

	def die
	end

	def discardNecklaceIfVisible
		for treasure in visibleTreasures
			if treasure.getType == TreasureKind::NECKLACE
				cardealer = CardDealer.getInstance
				cardealer.giveTreasureBack(treasure)
				visibleTreasures.delete(treasue)
			end
		end
	end

	#Metodo que hace morir al jugador si no tiene tesoros de ningún tipo

	def dieIfNoTreasures
		if @hiddenTreasures.empty? && @visibleTreasures.empty?
			@dead=true
		end
	end

	#Metodo que consulta si puedes comprar tantos niveles como le pasamos como parametros, 
	#teniendo en cuenta que no puedes ganar comprando niveles, es decir, si comprando los niveles
	#alcanzas o superas el nivel 10, no podrás compras los niveles.
	def canIBuyLevels(l)
		if (@level+l)<10
			true
		else
			false
		end
	end

	protected
	def computeGoldCoinsValue(t)
		value = 0
		for treasure in t
			value = value + treasure.goldCoins
		end

		return value/1000

	end

	public
	def applyPrize(p)
	end

	def combat(m)
	end

	def applyBadConsequence(bad)
	end

	#Metodo que devuelve el nivel con el que juega el jugador la batalla teniendo en cuenta
	#el bonus que suman los tesoros visibles.
	#Ademas tenemos en cuenta si lleva puesto el collar o no, ya que en caso de llevarlo puesta suma
	#el máximo bonus cada tesoro y el mínimo en caso contrario.
	def getCombatLevel
		#vemos si esta equipado el collar y devolvemos una puntuacion u otra 
		puntuacionMax=@level
		puntuacionMin=@level
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
		numOneHand = 0

		for treasure in visibleTreasures
			if treasure.getType == t.getType
				if t.getType == TreasureKind::ONEHAND
					if numOneHand == 1
						return false
					else
						numOneHand = numOneHand + 1
					end
				end
			else
				if (t.getType == TreasureKind::ONEHAND and t.getType == TreasureKind::BOTHHANDS) or (t.getType == TreasureKind::BOTHHANDS and t.getType == TreasureKind::ONEHANDS)
					return false
				end
			end
		end

		return true

	end
		
	end

	def discardVisibleTreasure(t)

	end

	def discardHiddenTreasure(t)
	end

	def buyLevels(visible, hidden)
	end

	#Nivel del jugador 
	attr_reader :level
	#Array con los tesoros visibles del jugador
	attr_reader :visibleTreasures
	#Array con los tesoros invisibles del jugador
	attr_reader :hiddenTreasures

	#Metodo que devuelve si el jugador está en un estado valid, es decir, si no tiene 
	#mal rollo pendiente y si el número de tesoros ocultos es menor o igual que 4
	def validState
		if (@pendingBadConsequence == nil or @pendingBadConsequence.isEmpty) and @hiddenTreasures.length<5
			true
		else
			false
		end
	end


	def initTreasures
	end

	#Metodo que devuelve si un jugador está muerto o no
	def isDead
		@dead
	end

	#Metodo que devuelve si un jugador tiene tesoros visibles o no
	def hasVisibleTreasures
		if @visibleTreasures.empty?
			false
		else
			true
		end
	end

	#def setVisibleTreasureList(t)
	#	@visibleTreasures=t
	#end
	#def setHiddenTreasureList(t)
	#	@hiddenTreasures=t
		
	#end
	
end
	

end