#encoding: utf-8
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
module Model
class CartasMonstruos
	def initialize 
		
		@monsters = Array.new
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes una armadura visible y otra oculta', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
		@unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

		#Chibithulhu
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 
		Array.new)
		@unusedMonsters << Monster.new('Chibithulhu', 2, prize, badConsequence)

		#El sopor de Dunwich
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes tu calzado visible', 0, [TreasureKind::SHOE], 
		Array.new)
		@unusedMonsters << Monster.new('El sopor de Dunwich', 2, prize, badConsequence)

		#Angeles de la noche ibicenca
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta',
		-1,[TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
		@unusedMonsters << Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

		#El gorron en el umbral
		prize = Prize.new(3,15)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles.', 0, 5, 0)
		@unusedMonsters << Monster.new('El gorron en el umbral', 10, prize, badConsequence)

		#H.P. Munchraft
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@unusedMonsters << Monster.new('H.P. Munchraft', 6, prize, badConsequence)

		#Bichgooth
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@unusedMonsters << Monster.new('Bichgooth', 2, prize, badConsequence)

		#El rey de la rosa
		prize = Prize.new(4,2)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
		@unusedMonsters << Monster.new('El rey de la rosa', 13, prize, badConsequence)

		#La que redacta en las tinieblas
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
		@unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, prize, badConsequence)

		#Los hondos
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto')
		@unusedMonsters << Monster.new('Los hondos', 8, prize, badConsequence)

		#Semillas Cthulhu
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0 ,2)
		@unusedMonsters << Monster.new('Semillas Cthulhu', 4, prize, badConsequence)

		#Dameargo
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0 ,[TreasureKind::ONEHAND], Array.new)
		@unusedMonsters << Monster.new('Dameargo', 1, prize, badConsequence)

		#Pollipólipo volante
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito.Pierdes 3 niveles',3,0,0)
		@unusedMonsters << Monster.new('Pollipólipo volante',3,prize,badConsequence)

		#YskhtihyssgGoth
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre.Estás muerto')
		@unusedMonsters << Monster.new('YskhtihyssgGoth',12,prize,badConsequence)

		#Familia feliz
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newDeath('La familia te atrapa.Estás muerto')
		@unusedMonsters << Monster.new('Familia feliz', 1, prize, badConsequence)

		#Roboggoth
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], Array.new)
		@unusedMonsters << Monster.new('Roboggoth', 8, prize, badConsequence)

		#El espia
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche.Pierdes un casco visible', 2, [TreasureKind::HELMET], Array.new)
		@unusedMonsters << Monster.new('El espia', 5, prize, badConsequence)
		#El lenguas
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas,Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
		@unusedMonsters << Monster.new('El lenguas', 20, prize, badConsequence)
		#Bicéfalo
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::ONEHAND , TreasureKind::BOTHHANDS], Array.new)
		@unusedMonsters << Monster.new('Bicéfalo', 20, prize, badConsequence)
	end

	attr_reader :monsters

end

end	











