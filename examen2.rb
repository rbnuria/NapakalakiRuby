#encoding: utf-8
require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
require_relative 'Dice.rb'
require_relative 'Player.rb'
require_relative 'CombatResult.rb'

module Model
class Examen2
	#ATributo constante privado y de clase
	@@INSTANCE = Examen2.new

	def initialize
	end

	#conustructor privado
	private_class_method :new

	#Metodo DE CLASE que devuelve el objeto
	def self.getInstance
		@@INSTANCE
	end

	def run
		#Jugador
		jugador = Player.new('Nuria')
		tesVisibles = Array.new
		tesVisibles = [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::HELMET]
		tesOcultos = Array.new
		tesOcultos = [TreasureKind::BOTHHANDS, TreasureKind::HELMET, TreasureKind::SHOE, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS, TreasureKind::HELMET, TreasureKind::SHOE, TreasureKind::ONEHAND]

		jugador.setVisibleTreasures(tesVisibles)
		jugador.setHiddenTreasures(tesOcultos)

		if(jugador.validState == false)
			puts "EL jugador no tiene un estado valido"
		else
			puts "EL jugador tiene un estado valido"
		end

		#badConsequence
		malrollo = BadConsequence.newLevelSpecificTreasures('Mal rollo', -1, Array.new, Array.new)
		jugador1=Player.new('a')
		jugador1.setPendingBadConsequence(malrollo)
		if(jugador1.validState == false)
			puts "EL jugador no tiene un estado valido"
		else
			puts "EL jugador tiene un estado valido"
		end

		malrollo2 = BadConsequence.newLevelNumberOfTreasures('Mal rollo 2', -1, -1, -1)
		jugador2 = Player.new('Nuria2')
		jugador2.setPendingBadConsequence(malrollo2)
		if(jugador2.validState == false)
			puts "EL jugador no tiene un estado valido"
		else
			puts "EL jugador tiene un estado valido"
		end

		malrollo3 = BadConsequence.newLevelSpecificTreasures('mal rollo 3', -1, Array.new, [TreasureKind::SHOE])
		jugador3 = Player.new('Nuria2')
		jugador3.setPendingBadConsequence(malrollo3)
		if(jugador3.validState == false)
			puts "EL jugador no tiene un estado valido"
		else
			puts "EL jugador tiene un estado valido"
		end
	end
end

prueba = Examen2.getInstance
prueba.run

end