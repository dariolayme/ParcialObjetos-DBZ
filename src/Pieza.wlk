class Pieza {
	var resistencia
	var desgaste
	
	method estaGastada() = desgaste >= 20
	
	method resistencia() = resistencia
	
	method desgastate() {
		desgaste += 5
	}
	
	
}