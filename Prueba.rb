# encoding: utf-8

require_relative 'CultistPlayer.rb'
require_relative 'Player.rb'
require_relative 'Monster.rb'
require_relative 'Cultist.rb'
require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
module Model
class Prueba
	#Creacion de un jugador sectario
	player = Player.new("Nuria")
	cultist = Cultist.new("Sectario",1)
	cultistplayer = CultistPlayer.new(player,cultist)

	#Creacion tesoro
	tesoroHelmet = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
	tesoro2hands = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::BOTHHANDS)
	tesoro1hand = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::ONEHAND)
	tesoroArmor = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::ARMOR)
	tesoroNecklace = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::NECKLACE)
	tesoroShoe = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::SHOE)

	tesoros = Array.new
	tesoros << tesoroHelmet
	tesoros << tesoroHelmet

	#Creacion badConsequence
	bc1 = BadConsequenceDeath.new('bc muerte')
	bc2 = BadConsequenceNumbers.new('bc numbers', 1,2,3)
	bc3 = BadConsequenceSpecific.new('bc lists',0,[TreasureKind::ONEHAND,TreasureKind::HELMET], [])

	#Creacion prize
	prize = Prize.new(1,1)
	#Creacion monstruo
	monster = Monster.new('Nombre monstruo', 4, prize, bc2, 3)
	
	#SON PROTEGIDOS
	puts cultistplayer.computeGoldCoinsValue(tesoros)
	puts player.computeGoldCoinsValue(tesoros)

	puts cultistplayer.shouldConvert
	puts player.shouldConvert

	puts player.getCombatLevel
	puts cultistplayer.getCombatLevel

	puts player.getOponentLevel(monster)
	puts cultistplayer.getOponentLevel(monster)

	cultist.getSpecialValue
	
	#Pruebas del adust to fit
	tesorosvisibles = Array.new
	tesorosvisibles << tesoro1hand
	tesorosvisibles << tesoro2hands
	puts "\nTesoros visible del jugador\n"
	for t in tesorosvisibles
		puts t.to_s
	end

	tesoroshidden = Array.new
	tesoroshidden << tesoro1hand
	tesoroshidden << tesoro2hands
	puts "\nTesoro hidden del jugador\n"
	for t in tesoroshidden
		puts t.to_s
	end

	player.addSpecificVisibleTreasures(tesorosvisibles)
	player.addSpecificHiddenTreasures(tesoroshidden)

	playervisible = Array.new
	playerhidden = Array.new
	playervisible = player.getVisibleTreasures
	puts "\nTesoros visibles del jugador despues de meterlos\n"
	for t in playervisible
		puts t.to_s
	end
	
	playerhidden = player.getHiddenTreasures
	puts "\nTesoros hidden del jugador despues de meterlos\n"
	for t in playerhidden
		puts t.to_s
	end

	bcadjust = BadConsequenceSpecific.new('Prueba',0,[TreasureKind::ONEHAND,TreasureKind::ONEHAND],[TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS])
	
	bcresultado = player.applyBadConsequence(bcadjust)

	puts bcresultado.to_s









end
end