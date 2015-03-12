
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
module NapakalakiRuby
class Main

	textito1="Has perdido!"
	textito2="Has muerto!"
	nombre="Ghador"
	nombre2="Ghador2"
	nombre3="Ghador3"
	nombre4="Ghador4"
	niveles = 3;
    tVisibles = 2;
    tOcultos = 3;
    muerte = true;

	tesorosVisibles=Array.new
	tesorosVisibles << [TreasureKind::BOTHHANDS]
	tesorosVisibles << [TreasureKind::ARMOR]
	tesorosInvisibles=Array.new
	tesorosInvisibles << [TreasureKind::ONEHAND]
	tesorosInvisibles << [TreasureKind::HELMET]

	#premios
	tesorosGanados = 5
    nivelesGanados = 1        
	premio=Prize.new(tesorosGanados,nivelesGanados)
	
	#Probando distintos constructores
	nVisibleTreasures=3
	nHiddenTreasures=2
	malrollito2=BadConsequence.newLevelNumberOfTreasures(textito2, niveles, nVisibleTreasures, nHiddenTreasures)
	malrollito3=BadConsequence.newDeath(textito2)
	malrollito4=BadConsequence.newLevelSpecificTreasures(textito1, niveles, tesorosVisibles, tesorosInvisibles)


	#creando monstruos
	
	monstruo2=Monster.new(nombre2,niveles,malrollito2,premio)
	monstruo3=Monster.new(nombre3,niveles,malrollito3,premio)
	monstruo4=Monster.new(nombre4,niveles,malrollito4,premio)
	
	puts monstruo2.badConsequence.to_s
	puts monstruo3.badConsequence.to_s
	puts monstruo4.badConsequence.to_s
end
end 	