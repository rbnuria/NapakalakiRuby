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

	private
	def newCopia(player)

        @dead = otro.isDead
        @name = otro.getName
        @level = otro.getLevel
        @hiddenTreasures = otro.getHiddenTreasures
        @visibleTreasures = otro.getVisibleTreasures
        @pendingBadConsequence = otro.getPendingBadConsequence
        
	end

	public
	def getLevel
		@level
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
		@level=1
		dealer=CardDealer.instance
		i=0
		while i<@visibleTreasures.length
		    treasure=@visibleTreasures[i]
		    dealer.giveTreasureBack(treasure)
		    i=i+1
		end
		@visibleTreasures.clear
		i=0
		while i<@hiddenTreasures.length
		    treasure=@hiddenTreasures[i]
		    dealer.giveTreasureBack(treasure)
		    i=i+1
		end
		@hiddenTreasures.clear
		dieIfNoTreasures
  	end

	def discardNecklaceIfVisible
		for treasure in @visibleTreasures
			if treasure.getType == TreasureKind::NECKLACE
				cardealer = CardDealer.instance
				cardealer.giveTreasureBack(treasure)
				@visibleTreasures.delete(treasure)
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
		return value
	end

	public

	def applyPrize(p)
		nLevels=p.getLevels
		incrementLevels(nLevels)
		nPrize=p.getTreasures
		dealer=CardDealer.instance
		for i in 1 .. nPrize
			treasure=dealer.nextTreasure
			@hiddenTreasures<<(treasure)
		end
	end

	def combat(m)
		myLevel=getCombatLevel
		levelMonster=getOponentLevel(m)
		if myLevel>levelMonster
			prize=m.getPrize
			applyPrize(prize)
			if getLevel<10
				combatResult= CombatResult::WIN
			else
				combatResult=CombatResult::WINANDWINGAME
				
			end
		else
			dice=Dice.instance
			escape=dice.nextNumber

			if escape < 5
				bad=m.getBadConsequence
				amIDead=bad.kills

				if amIDead
					die
					combatResult= CombatResult::LOSEANDDIE
				else
					applyBadConsequence(bad)
					if shouldConvert
						combatResult = CombatResult::LOSEANDCONVERT
					else
						combatResult= CombatResult::LOSE
					end
				end
			else
				combatResult= CombatResult::LOSEANDESCAPE
			end
		end
		discardNecklaceIfVisible
		return combatResult
	end

	def applyBadConsequence(bad)
		nLevels=bad.getLevels
		decrementLevels(nLevels)
		pendingBad=bad.adjustToFitTreasureLists(@visibleTreasures,@hiddenTreasures)
		setPendingBadConsequence(pendingBad)
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
			return puntuacionMin
		end
	end

	def makeTreasureVisible(t)
		if canMakeTreasureVisible(t)
			@visibleTreasures<<t
			discardHiddenTreasure(t)
		end
	end

	def canMakeTreasureVisible(treasure)
		numOneHand = 0
		valido=true
		for t in @visibleTreasures
			if t.getType == treasure.getType
				if t.getType==TreasureKind::ONEHAND
					if numOneHand==2
						valido=false					
					else
						numOneHand=numOneHand+1
						if(numOneHand==2)
							valido = false
						end
										
					end
				else
					valido=false		
				end
			else
				if (treasure.getType == TreasureKind::ONEHAND && t.getType == TreasureKind::BOTHHANDS)|| (treasure.getType == TreasureKind::BOTHHANDS && t.getType == TreasureKind::ONEHAND)
					valido=false		
				end
			end
			if valido==false
				return valido
				break
			end
		end
		valido

	end


	def discardVisibleTreasure(t)
		@visibleTreasures.delete(t)
		if (@pendingBadConsequence != nil) and (@pendingBadConsequence.isEmpty == false)
			@pendingBadConsequence.substractVisibleTreasure(t)
		end

		CardDealer.instance.giveTreasureBack(t)
		dieIfNoTreasures

			
	end

	def discardHiddenTreasure(t)
		@hiddenTreasures.delete(t)
		if (@pendingBadConsequence != nil) and (@pendingBadConsequence.isEmpty == false)
			@pendingBadConsequence.substractHiddenTreasure(t)
		end

		CardDealer.instance.giveTreasureBack(t)
		dieIfNoTreasures
	end

	def buyLevels(visible, hidden)
		levels=computeGoldCoinsValue(visible)
		levels+=computeGoldCoinsValue(hidden)
		levels = levels/1000

		canI=canIBuyLevels(levels)
		if canI
			incrementLevels(levels)
			for t in visible
				discardVisibleTreasure(t)
			end
			for t in hidden
				discardHiddenTreasure(t)
			end
		end
		canI
	end

	#Nivel del jugador 
	attr_reader :level
	#Array con los tesoros visibles del jugador
	attr_reader :visibleTreasures
	#Array con los tesoros invisibles del jugador
	attr_reader :hiddenTreasures
	#Nombre del jugador
	attr_reader :name
	def getName
		@name
	end
	def getHiddenTreasures
		@hiddenTreasures
	end

	def getVisibleTreasures
		@visibleTreasures
	end
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
		bringToLive
		dice=Dice.instance
		dealer=CardDealer.instance
		number=dice.nextNumber
		if(number==1)
			treasure=dealer.nextTreasure
			@hiddenTreasures<<treasure
		else
			if number < 6
				i=0
				while i<2
					treasure=dealer.nextTreasure
					@hiddenTreasures<<treasure
					i+=1
				end
			else
				if number==6
					i=0
				end
				while i<3
					treasure=dealer.nextTreasure
					@hiddenTreasures<<treasure
					i+=1
				end	
			end
		end
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

	def to_s
		combatl = getCombatLevel.to_s

		@name+"\n\tNivel: "+@level.to_s+"\n\tNivel de combate: "+combatl+"\n"
	end

	protected
	def getOponentLevel(monster)
		monster.getBasicValue
	end

	def shouldConvert
		dado = Dice.instance.nextNumber

		if dado == 6
			return true
		else
			return false
	end

	
	
end
end