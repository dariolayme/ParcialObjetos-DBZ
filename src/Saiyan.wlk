import Guerrero.*
import Estado.*

class Saiyan inherits Guerrero{
	var estado 
	
	method transformarse(unEstado){
		estado = unEstado
	}
	
	override method comerSemilla(){
		super()
		potencialOfensivo += 5
		
	}
	
	override method recibirDanio(unaCantidad){
		
		super(estado.resistenciaSobre(unaCantidad))
		
		if (nivelDeEnergia < (energiaOriginal * 0.01)){
			
			self.transformarse(normal)
		}		
	}
	
	override method danio() = estado.aumentoDePoder(self) * 0.1 
	
	
}
/* */