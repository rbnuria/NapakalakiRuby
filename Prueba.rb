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
	jugador = Player.new("Nuria")
	cultist = Cultist.new("Sectario",1)
	cultistplayer = CultistPlayer.new(jugador,cultist)

	#Creacion tesoro
	tesoro1 = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
	tesoro2 = Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
	tesoros = Array.new
	tesoros << tesoro1
	tesoros << tesoro2
	#Creacion badConsequence
	bc1 = BadConsequenceDeath.new('bc muerte')
	bc2 = BadConsequenceNumbers.new('bc numbers', 1,2,3)
	bc3 = BadConsequenceSpecific.new('bc lists',0,[TreasureKind::ONEHAND,TreasureKind::HELMET], [])

	#Creacion prize
	prize = Prize.new(1,1)
	#Creacion monstruo
	monster = Monster.new('Nombre monstruo', 4, prize, bc2, 3)
	
	puts cultistplayer.computeGoldCoinsValue(tesoros)
	puts player.computeGoldCoinsValue(tesoros)

	puts cultistplayer.shouldConvert
	puts player.shouldConvert

	puts player.getCombatLevel
	puts cultistplayer.getCombatLevel

	puts player.getOponentLevel
	puts cultistplayer.getOponentLevel



end
end