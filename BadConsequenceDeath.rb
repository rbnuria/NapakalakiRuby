#encoding: utf-8
require_relative 'BadConsequence.rb'

module Model
class BadConsequenceDeath < BadConsequence
	def initialize(txt)
		super(txt, 0, 0, 0, true, Array.new, Array.new)
	end

	def isEmpty
		true
	end

	def to_s
		if(@death)
			muerto = "true";
		else
			muerto = "false";
		end

		salida = super
		salida += "\n\tTexto: " + @text + "\n\tMuerte: " + muerto

		return salida

	end

	public_class_method :new

end
end