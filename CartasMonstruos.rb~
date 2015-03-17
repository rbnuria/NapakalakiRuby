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
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes una armadura visible y otra oculta', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
		@monsters << Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

		#Chibithulhu
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 
		Array.new)
		@monsters << Monster.new('Chibithulhu', 2, prize, badConsequence)

		#El sopor de Dunwich
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes tu calzado visible', 0 , [TreasureKind::SHOE], 
		Array.new)
		@monsters << Monster.new('El sopor de Dunwich', 2, prize, badConsequence)

		#Angeles de la noche ibicenca
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta',
		0,1,1)
		@monsters << Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

		#El gorron en el umbral
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles.', 0, 5, 5)
		@monsters << Monster.new('El gorron en el umbral', 10, prize, badConsequence)

		#H.P. Munchraft
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@monsters << Monster.new('H.P. Munchraft', 6, prize, badConsequence)

		#Bichgooth
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@monsters << Monster.new('Bichgooth', 2, prize, badConsequence)

		#El rey de la rosa
		prize = Prize.new(4,2)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
		@monsters << Monster.new('El rey de la rosa', 13, prize, badConsequence)

		#La que redacta en las tinieblas
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
		@monsters << Monster.new('La que redacta en las tinieblas', 2, prize, badConsequence)

		#Los hondos
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto')
		@monsters << Monster.new('Los hondos', 8, prize, badConsequence)

		#Semillas Cthulhu
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0 ,2)
		@monsters << Monster.new('Semillas Cthulhu', 4, prize, badConsequence)

		#Dameargo
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0 ,[TreasureKind::ONEHAND], Array.new)
		@monsters << Monster.new('Dameargo', 1, prize, badConsequence)

	end

	attr_reader :monsters

end

end	











