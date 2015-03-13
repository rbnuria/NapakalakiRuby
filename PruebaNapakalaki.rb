require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'CartasMonstruos.rb'
module NapakalakiRuby
class Main

	monstruos = CartasMonstruos.new

	#Monstruos cuyo nivel de combate es superior a 10
	puts "\nMonstruos con un nivel de combate superior a 10"
	for monster in monstruos.monsters
		if monster.combatLevel > 10
			puts monster.to_s
		end
	end

	#Monstruos cuyo mal rollo suponga solo perdida de niveles
	puts "\nMonstruos cuyo malRollo solo suponga perdida de niveles"
	for monster in monstruos.monsters
		if (monster.badConsequence.nVisibleTreasures == -1 && monster.badConsequence.nHiddenTreasures == -1) || (monster.badConsequence.specificVisibleTreasures == nil && monster.badConsequence.specificHiddenTreasures == nil)
			if monster.badConsequence.levels != -1 && monster.badConsequence.levels != 0
				puts monster.to_s
			end
		end
	end

	#Monstruos cuyo buen rollo implique una ganancia de mas de un nivel
	puts "\nMonstruos cuyo buen rollo implique ganancia de niveles de mas de un nivel"
	for monster in monstruos.monsters
		if monster.prize.levels > 1
			puts monster.to_s
		end
	end

	#Monstruos cuyo malRollo implique la perdida de algun ONEHAND (visible u oculta) son 
	puts "\nMonstruos cuyo mal rollo implique perdida de algun ONEHAND (visible u oculta)"
	for monster in monstruos.monsters
		esValido = false;
		for tesoros in monster.badConsequence.specificVisibleTreasures
			if monster.badConsequence.specificVisibleTreasures == [TreasureKind::ONEHAND]
				esValido = true
			end
		end

		for tesoros in monster.badConsequence.specificHiddenTreasures
			if monster.badConsequence.specificHiddenTreasures == [TreasureKind::ONEHAND]
				esValido = true
			end
		end

		if esValido
			puts monster.to_s
		end
	end

end
end 	