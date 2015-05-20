# encoding: utf-8

require_relative 'CultistPlayer.rb'
require_relative 'Player.rb'
require_relative 'Monster.rb'
require_relative 'Cultist.rb'
require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
module Model
class Prueba
	##################################### CREACION OBJETOS ###########################################

	#TESOROS
	tesoroHelmet = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
	tesoro2hands = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::BOTHHANDS)
	tesoro1hand = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::ONEHAND)
	tesoroArmor = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::ARMOR)
	tesoroNecklace = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::NECKLACE)
	tesoroShoe = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::SHOE)

	tesoros = Array.new
	tesoros << tesoroHelmet
	tesoros << tesoroHelmet

	#MALOS ROLLOS
	bcdeath = BadConsequenceDeath.new('bc muerte')
	bcnumber = BadConsequenceNumbers.new('bc numbers', 1,2,3)
	bclist = BadConsequenceSpecific.new('bc lists',0,[TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::HELMET], [TreasureKind::ONEHAND, TreasureKind::ARMOR])

	#Creacion prize
	prize = Prize.new(1,1)
	#Creacion monstruo
	monster = Monster.new('Nombre monstruo', 4, prize, bcnumber, 3)

	#Creacion de un jugador sectario
	player = Player.new("Nuria")
	cultist = Cultist.new("Sectario",1)
	cultistplayer = CultistPlayer.new(player,cultist)
	
	##################################### METODOS ###########################################
	#BAD CONSEQUENCE
	bclist.substractVisibleTreasure(tesoroShoe)
	bclist.substractHiddenTreasure(tesoro1hand);
        
    bcnumber.substractVisibleTreasure(tesoroShoe);
    bcnumber.substractHiddenTreasure(tesoro1hand);


    v = Array.new
    v << tesoro1hand
    v << tesoro1hand
    v << tesoro1hand
    v << tesoro1hand
    v << tesoro1hand
    v << tesoro2hands
    v << tesoroNecklace

    h = Array.new
    h << tesoro1hand
    h << tesoroHelmet
    h << tesoroArmor

    puts bclist.to_s
   	puts bcnumber.to_s

    adjust = bclist.adjustToFitTreasureLists(v,h)
    adjust1 = bcnumber.adjustToFitTreasureLists(v,h)

    bc_empty_n = BadConsequenceNumbers.new('Vacio numeros',0,0,0)
    bc_empty_l = BadConsequenceSpecific.new('Vacio listas', 0, [],[])

    adjust2 = bc_empty_n.adjustToFitTreasureLists(v,h)
    adjust3 = bc_empty_l.adjustToFitTreasureLists(v,h)

    puts adjust.to_s
    puts adjust1.to_s
    puts adjust2.to_s
    puts adjust3.to_s

    # PLAYEEEEEERRRR
    player.addSpecificVisibleTreasures(v)
	player.addSpecificHiddenTreasures(h)

	level1 = player.getCombatLevel
	level2 = cultistplayer.getCombatLevel

	for i in 0 .. 10
		#puts player.shouldConvert Es protegido
	end

	for i in 0 .. 10
		#puts cultistplayer.shouldConvert Es protegido
	end

	#player.computeGoldCoinsValue
	#cultist.computeGoldCoinsValue

	#Se ajusta y despues se aplica
	player.applyBadConsequence(bcnumber)
	#player.setPendingBadConsequence(bcnumber)

	player.makeTreasureVisible(tesoroHelmet)
	player.validState

	player.discardVisibleTreasure(tesoro1hand)
	player.discardVisibleTreasure(tesoroHelmet)













end
end