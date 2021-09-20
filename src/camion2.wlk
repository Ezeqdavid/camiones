import cosas2.*

object camion {
	const property cosas = []
	
	method cargar(cosa) {
		if (0.randomUpTo(3) >= 2) {
			cosa.reaccionar()	
		}
		cosas.add(cosa)
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() {
		return not cosas.any({cosa => cosa.peso() % 2 != 0})
	}
	
	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}
	
	method elDeNivel(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel}).first()
	}
	
	method pesoTotal() {
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})	
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso() > min}) and cosas.any({cosa => cosa.peso() < max})
	}
	
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
	
	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}
	
	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	} 
}

