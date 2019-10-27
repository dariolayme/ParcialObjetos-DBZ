class Guerrero {
	var potencialOfensivo =0
	var experiencia = 0
	var nivelDeEnergia = 0
	var energiaOriginal = 0
	var traje = null
	
	method atacarA(unGuerrero) {
		unGuerrero.recibirDanio(self.danioHacia(unGuerrero))
	}
	
	method recibirDanio(unaCantidad) {
		
		nivelDeEnergia -= unaCantidad
		self.ganarExperiencia(1)
		
		if (self.tieneTraje()){
			
			self.ganarExperiencia(traje.experienciaAdicional())
		}
		
	}
	
	method danioHacia(unGuerrero) {
		
		if(self.tieneTraje().negate() || traje.estaGastado()){
			return self.danio() // daño directo
		}
		else{
			return self.danio() - unGuerrero.defensa()
		}
	}
	
	method tieneTraje() = traje != null
	
	method ganarExperiencia(unaCantidad) {
		
		experiencia += unaCantidad
	}
	
	method danio() = potencialOfensivo * 0.1
	
	method ponerseTraje(unTraje) {
		
		traje = unTraje
	}
	
	method comerSemilla(){
		
		nivelDeEnergia = energiaOriginal
	}
	
	method defensa() = traje.resistenciaA(self) // amortiguacion()
	
	method poderOfensivo() = potencialOfensivo
		
	
}