
class Estado {
	
	method porcentajeDeResistencia() = 0
	
	method resistenciaSobre(unaCantidad) = unaCantidad * (100 - self.porcentajeDeResistencia())
	
	method aumentoDePoder(unSaiyan)
}

object normal inherits Estado{
	
	
	override method aumentoDePoder(unSaiyan) = unSaiyan.poderOfensivo()
}




class SuperSaiyan inherits Estado {
	
	
	override method aumentoDePoder(unSaiyan) = unSaiyan.poderOfensivo() * 1.5 // aumentael 50% si era 100 => 150
}




object fase1 inherits SuperSaiyan{
	
	override method porcentajeDeResistencia() = 5
	
	
}
object fase2 inherits SuperSaiyan{
	
	override method porcentajeDeResistencia() = 7
		
}
object fase3 inherits SuperSaiyan{
	
	override method porcentajeDeResistencia() = 15
		
}
