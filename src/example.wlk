class Guerrero {
	var potencialOfensivo
	var experiencia
	var nivelDeEnergia
	var energiaOriginal
	var traje = null
	
	method atacarA(unGuerrero) {
		unGuerrero.recibirDanio(self.danioHacia(unGuerrero))
	}
	
	method recibirDanio(unaCantidad) {
		
		nivelDeEnergia -= unaCantidad
		
		if (self.noTieneTraje()){
			
			self.ganarExperiencia(1)
		}
		else{		
			self.ganarExperiencia(traje.experienciaAdicianal())
		}
	}
	
	method danioHacia(unGuerrero) {
		
		if(self.noTieneTraje() || traje.estaGastado()){
			return self.danio() // daño directo
		}
		else{
			return self.danio() - unGuerrero.defensa()
		}
	}
	
	method noTieneTraje() = traje == null
	
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
	
	method defensa() = traje.disminuirDanioDe(self) // amortiguacion()
		
	
}