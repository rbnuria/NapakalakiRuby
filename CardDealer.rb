#encoding: utf-8
require 'singleton'
require_relative 'TreasureKind.rb'

module Model

class CardDealer
include Singleton

	#Metodo initialie de la clase CardDealer en el cual inicializamos los cuatro atributos (Arrays) como Arrays vacios
	def initialize
		@unusedMonsters= Array.new
		@usedMonsters = Array.new
		@usedTreasures = Array.new
		@unusedTreasures = Array.new
		@unusedCultist = Array.new

	end

	#Metodo que inicializa el taco de cartas con todos los tesoros que intervedrán en el juego
	def initTreasureCardDeck

	  @unusedTreasures << Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)   
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 800, 1, 1, TreasureKind::SHOE)   
      @unusedTreasures << Treasure.new("Casco minero", 400, 2, 4, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)   
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR)   
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("Fez alópodo", 700, 3, 5, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("Hacha prehistórica", 500, 2, 5, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 900, 4, 8, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 500, 4, 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 300, 2, 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de tres cañones", 700, 4, 6, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La fuerza de Mr. T", 1000, 0, 0, TreasureKind::NECKLACE)
      @unusedTreasures << Treasure.new("La rebeca metálica", 400, 2, 3, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 200, 3, 4, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necroplayboycon", 300, 3, 5, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Lanzallamas", 800, 4, 8, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necrocomicón", 100, 1, 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 800, 5, 7, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a dos manos", 400, 3, 6, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necrognomicón", 200, 2, 4, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 300, 2, 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Porra preternatural", 200, 2, 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentáculo de pega", 200, 0, 1, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 500, 0, 1, TreasureKind::SHOE)
      @unusedTreasures << Treasure.new("Shogulador", 600, 1, 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND)
	end

	#Metodo que inicializa el taco de cartas con todos los monstruos que intervendrán en el juego
	def initMonsterCardDeck
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceSpecific.new('Pierdes una armadura visible y otra oculta', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
		@unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

		#Chibithulhu
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceSpecific.new('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 
		Array.new)
		@unusedMonsters << Monster.new('Chibithulhu', 2, prize, badConsequence)

		#El sopor de Dunwich
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceSpecific.new('El primordial bostezo contagioso. Pierdes tu calzado visible', 0, [TreasureKind::SHOE], 
		Array.new)
		@unusedMonsters << Monster.new('El sopor de Dunwich', 2, prize, badConsequence)

		#Angeles de la noche ibicenca
		prize = Prize.new(4,1)
		badConsequence = BadConsequenceSpecific.new('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta',
		0,[TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
		@unusedMonsters << Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

		#El gorron en el umbral
		prize = Prize.new(3,15)
		badConsequence = BadConsequenceNumbers.new('Pierdes todos tus tesoros visibles.', 0, 5, 0)
		@unusedMonsters << Monster.new('El gorron en el umbral', 10, prize, badConsequence)

		#H.P. Munchraft
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceSpecific.new('Pierdes tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@unusedMonsters << Monster.new('H.P. Munchraft', 6, prize, badConsequence)

		#Bichgooth
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceSpecific.new('Sientes bichos bajo la ropa. Descarta tu armadura visible', 0, [TreasureKind::ARMOR], Array.new)
		@unusedMonsters << Monster.new('Bichgooth', 2, prize, badConsequence)

		#El rey de la rosa
		prize = Prize.new(4,2)
		badConsequence = BadConsequenceNumbers.new('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
		@unusedMonsters << Monster.new('El rey de la rosa', 13, prize, badConsequence)

		#La que redacta en las tinieblas
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceNumbers.new('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
		@unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, prize, badConsequence)

		#Los hondos
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceDeath.new('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto')
		@unusedMonsters << Monster.new('Los hondos', 8, prize, badConsequence)

		#Semillas Cthulhu
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceNumbers.new('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0 ,2)
		@unusedMonsters << Monster.new('Semillas Cthulhu', 4, prize, badConsequence)

		#Dameargo
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceSpecific.new('Te intentas escaquear. Pierdes una mano visible', 0 ,[TreasureKind::ONEHAND], Array.new)
		@unusedMonsters << Monster.new('Dameargo', 1, prize, badConsequence)

		#Pollipólipo volante
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceNumbers.new('Da mucho asquito.Pierdes 3 niveles',3,0,0)
		@unusedMonsters << Monster.new('Pollipólipo volante',3,prize,badConsequence)

		#YskhtihyssgGoth
		prize = Prize.new(3,1)
		badConsequence = BadConsequenceDeath.new('No le hace gracia que pronuncien mal su nombre.Estás muerto')
		@unusedMonsters << Monster.new('YskhtihyssgGoth',12,prize,badConsequence)

		#Familia feliz
		prize = Prize.new(4,1)
		badConsequence = BadConsequenceDeath.new('La familia te atrapa.Estás muerto')
		@unusedMonsters << Monster.new('Familia feliz', 1, prize, badConsequence)

		#Roboggoth
		prize = Prize.new(2,1)
		badConsequence = BadConsequenceSpecific.new('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], Array.new)
		@unusedMonsters << Monster.new('Roboggoth', 8, prize, badConsequence)

		#El espia
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceSpecific.new('Te asusta en la noche.Pierdes un casco visible', 2, [TreasureKind::HELMET], Array.new)
		@unusedMonsters << Monster.new('El espia', 5, prize, badConsequence)
		#El lenguas
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceNumbers.new('Menudo susto te llevas,Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
		@unusedMonsters << Monster.new('El lenguas', 20, prize, badConsequence)
		#Bicéfalo
		prize = Prize.new(1,1)
		badConsequence = BadConsequenceSpecific.new('Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::ONEHAND , TreasureKind::ONEHAND , TreasureKind::BOTHHANDS], Array.new)
		@unusedMonsters << Monster.new('Bicéfalo', 20, prize, badConsequence)
	end

	#Metodo que baraja el taco de cartas de tesoros que aún no hemos utilizado
	def shuffleTreasures
		@unusedTreasures.shuffle!
	end

	#Metodo que baraja el taco de cartas de monstruos que aún no hemos utilizado
	def shuffleMonsters
		@unusedMonsters.shuffle!
	end

	public
	def nextTreasure
		#Comprobamos si esta vacia y la rellenamos otra vez
		if @unusedTreasures.empty?
			for treasure in @usedTreasures
				@unusedTreasures << treasure
			end
			@usedTreasures = Array.new
			shuffleTreasures
		end

		t = @unusedTreasures[0]
		@unusedTreasures.delete(t)

		return t
		
	end

	def nextMonster
		#Comprobamos si esta vacia y la rellenamos otra vez
		if @unusedMonsters.empty?
			for monster in @usedMonsters
				@unusedMonsters << monster
			end
			@usedMonsters = Array.new
			shuffleMonsters
		end

		t = @unusedMonsters[0]
		@unusedMonsters.delete(t)

		return t
		
	end

	#Metodo que añade un tesoro pasado como argumento al taco de tesoros ya utilizados
	def giveTreasureBack(t)
		@usedTreasures << t
	end

	#Metodo que añade un monstruo pasado como argumento al taco de monstruos ya utilizados
	def giveMonsterBack(m)
		@usedMonsters << m
	end

	def initCards
		initMonsterCardDeck
		shuffleMonsters
		initTreasureCardDeck
		shuffleTreasures
		initCultistCardDeck
		shuffleCultists
	end

	def nextCultist
		cultist = @unusedCultist.get(0)
		unusedCultist.delete_at(0)
		return cultist
	end

	private
	def shuffleCultists
		@unusedCultist.shuffle!
	end

	def initCultistCardDeck
	    @unusedCultist << Cultist.new("Sectario", 1)
        @unusedCultist << Cultist.new("Sectario", 2)
        @unusedCultist << Cultist.new("Sectario", 1)
        @unusedCultist << Cultist.new("Sectario", 2)
        @unusedCultist << Cultist.new("Sectario", 1)
        @unusedCultist << Cultist.new("Sectario", 1)
	end


end
end


