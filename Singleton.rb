module ..

class Singleton
	#ATributo constante privado y de clase
	@@INSTANCE = Singleton.new

	def initialize
	end

	#conustructor privado
	private_class_method :new

	#Metodo DE CLASE que devuelve el objeto
	def self.getInstance
		@@INSTANCE
	end
	
end
end