object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() {return 1}
	method reaccionar() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() {return 2}
	method reaccionar() { self.transformar() }
}

object paqueteDeLadrillos {
	var cantLadrillos
	
	method definirCantidad(cant) {	cantLadrillos = cant }
	method peso() { return 2 * cantLadrillos }
	method nivelPeligrosidad() = 2
	method bultos() { 
		if (cantLadrillos >= 100 and cantLadrillos <= 1) {
			return 1
		}
		else if (cantLadrillos >= 300 and cantLadrillos <= 101) {
			return 2
		}else {
			return 3
		}
	}
	method reaccionar() {cantLadrillos += 12}
}

object arenaAGranel {
	var cantArena
	
	method definirCantidad(cant) { cantArena = cant}
	method peso() = cantArena
	method nivelPeligrosidad() = 1
	method bultos() {return 1}
	method reaccionar() {cantArena += 20}
}

object bateriaAntiaerea {
	var cargada
	
	method peso() {return if (cargada) {300} else {200} }
	method nivelPeligrosidad() {return if (cargada) {100} else {0} }
	method cargarMisiles() {cargada = true}
	method descargarMisiles() {cargada = false}
	method bultos() {return if (cargada) {2} else {1} }
	method reaccionar() {self.cargarMisiles()}
}
object contenedorPortuario	{
	const property cosas = []
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method peso() {
		return 100 + cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad() {
		return if (cosas.isEmpty()) {0} else {cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()}		
	}
	method bultos() {
		return 1 + cosas.sum({cosa => cosa.bultos()})
	}
	method reaccionar() {
		cosas.anyOne().reaccionar()
	}
}

object residuosRadioactivos {
	var peso
	
	method definirCantidad(kg) { peso = kg}
	method peso() = peso
	method nivelPeligrosidad() { return 200	}
	method bultos() {return 1}
	method reaccionar() {peso += 15}
}

object embalajeDeSeguridad {
	var cosa
	
	method embalar(unaCosa) { cosa = unaCosa }
	method peso() {return cosa.peso()}
	method nivelPeligrosidad() {return cosa.nivelPeligrosidad() / 2}
	method bultos() {return 2}
	method reaccionar() {}
}
