class Traje{
	
	var desgate
	var porcentaje/*??? */
	
	method resistenciaA(unGuerrero)
	
	method experienciaAdicional()

	method estaGastado() = desgate >= 100
	
	method desgastate(){
		desgate -= 5
	}
	
		
}

class TrajeComun inherits Traje {
	var porcentajeDefensa
	
	override method resistenciaA(unGuerrero){
		self.desgastate()
		return unGuerrero.danio() * porcentajeDefensa/100
	}
	
	override method experienciaAdicional() = 0
	
	
}

object trajeEntrenamiento inherits Traje {
	
	var property porcentajeExperiencia = 0
	
	override method resistenciaA(unGuerrero){
		
		self.desgastate()
		return 0		
	}
	
	override method experienciaAdicional() = porcentajeExperiencia/100
	
}


class TrajeModularizado inherits Traje{
	
	var piezas
	
	override method resistenciaA(unGuerrero) {
		self.desgastate()
		
		return self.piezasBuenas().sum({	pieza => pieza.resistencia()	})
	}
	
	override method experienciaAdicional() {
		
		return self.porcentajeDePiezasBuenas()/100
		
	}
	
	override method estaGastado() = piezas.all({		pieza => pieza.estaGastada()		})
	
	override method desgastate() {
		piezas.forEach({	pieza => pieza.desgastate()		})
	}
	
	
	method piezasBuenas() = piezas.filter({		pieza => pieza.estaGastada().negate()		})
		
	method porcentajeDePiezasBuenas() = self.cantidadDePiezasBuenas() / 100
	
	method cantidadDePiezasBuenas() = self.piezasBuenas().size()
	
	
}