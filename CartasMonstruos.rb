require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
module NapakalakiRuby
class CartasMonstruos
	def initialize 
		@monsters = Array.new

		#3 Byakhees de bonanza
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes una armadura visible y otra oculta', -1, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
		@monsters << Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

		#Chibithulhu
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', -1, [TreasureKind::HELMET], 
		Array.new)
		@monsters << Monster.new('Chibithulhu', 2, prize, badConsequence)

		#El sopor de Dunwich
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes tu calzado visible', -1, [TreasureKind::SHOE], 
		Array.new)
		@monsters << Monster.new('El sopor de Dunwich', 2, prize, badConsequence)

		#Angeles de la noche ibicenca
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta',
		-1,[TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
		@monsters << Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

		#El gorron en el umbral
		prize = Prize.new(3,15)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles.', -1, 5, -1)
		@monsters << Monster.new('El gorron en el umbral', 10, prize, badConsequence)

		#H.P. Munchraft
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible', -1, [TreasureKind::ARMOR], Array.new)
		@monsters << Monster.new('H.P. Munchraft', 6, prize, badConsequence)

		#Bichgooth
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta tu armadura visible', -1, [TreasureKind::ARMOR], Array.new)
		@monsters << Monster.new('Bichgooth', 2, prize, badConsequence)

		#El rey de la rosa
		prize = Prize.new(4,2)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, -1)
		@monsters << Monster.new('El rey de la rosa', 13, prize, badConsequence)

		#La que redacta en las tinieblas
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, -1, -1)
		@monsters << Monster.new('La que redacta en las tinieblas', 2, prize, badConsequence)

		#Los hondos
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto')
		@monsters << Monster.new('Los hondos', 8, prize, badConsequence)

		#Semillas Cthulhu
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, -1 ,2)
		@monsters << Monster.new('Semillas Cthulhu', 4, prize, badConsequence)

		#Dameargo
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', -1 ,[TreasureKind::ONEHAND], Array.new)
		@monsters << Monster.new('Dameargo', 1, prize, badConsequence)

		#Pollipólipo volante
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito.Pierdes 3 niveles',3,-1,-1)
		@monsters << Monster.new('Pollipólipo volante',3,prize,badConsequence)

		#YskhtihyssgGoth
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre.Estás muerto')
		@monsters << Monster.new('YskhtihyssgGoth',12,prize,badConsequence)

		#Familia feliz
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newDeath('La familia te atrapa.Estás muerto')
		@monsters << Monster.new('Familia feliz', 1, prize, badConsequence)

		#Roboggoth
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], Array.new)
		@monsters << Monster.new('Roboggoth', 8, prize, badConsequence)

		#El espia
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche.Pierdes un casco visible', 2, [TreasureKind::HELMET], Array.new)
		@monsters << Monster.new('El espia', 5, prize, badConsequence)
		#El lenguas
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas,Pierdes 2 niveles y 5 tesoros visibles', 2, 5, -1)
		@monsters << Monster.new('El lenguas', 20, prize, badConsequence)
		#Bicéfalo
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::ONEHAND , TreasureKind::BOTHHANDS], Array.new)
		@monsters << Monster.new('Bicéfalo', 20, prize, badConsequence)

	end

	attr_reader :monsters

end

end	











