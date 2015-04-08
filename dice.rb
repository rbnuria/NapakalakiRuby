#encoding: utf-8
require 'singleton'

module NapakalakiGame
class Dice

	include Singleton

	  #Metodo que devuelve un número del dado aleatorio
	  def nextNumber
	    return 1 + rand(6)
	  end
	end

end