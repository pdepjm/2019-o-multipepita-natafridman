object pepita {
	var costo_fijo = 10
	var energia = 0
	
	method energia() = energia
	
	method vola(kilometros){
		energia -= (kilometros + costo_fijo)
	}
	
	method come(comida){
		energia += comida.energia_al_comerse()
	}
	
	method estaCansada() = energia < 50
	
	method estaFeliz() = energia > 500 && energia < 1000
	
	method cuantoQuiereVolar() {
		var kmVolar = energia / 5
		if(energia > 300 && energia < 400) {
			kmVolar += 10
		}
		if(energia % 20 == 0){
			kmVolar += 15
		}
		return kmVolar
	}
	
	method salirAComer(){
		self.vola(5)
		self.come(alpiste)
		self.vola(5)
	}
	
	method haceLoQueQuieras(){
		if(self.estaCansada())
		{
			self.come(alpiste)
		}
		if(self.estaFeliz())
		{
			self.vola(8)
		}
	}
}

object alpiste {
	method gramo() = 10
	method energia_al_comerse() = 4 * self.gramo()
}

object manzana {
	method energia_al_comerse() = 50
}

object mijo {
	var estaMojado = true
	
	method energia_al_comerse() {
		if(estaMojado) {
			return 15
		}
		else {
			return 20
		}
	}
	
	method mojarse() {
		estaMojado = true
	} 
	
	method secarse() {
		estaMojado = false
	}
}

object canelones {
	var tieneQueso = false
	var tieneSalsa = false
	
	method sacarSalsa(){
		tieneSalsa = false
	}
	
	method ponerSalsa(){
		tieneSalsa = true
	}
	
	method ponerQueso(){
		tieneQueso = true
	}
	
	method sacarQueso(){
		tieneQueso = false
	}
	
	method energia_al_comerse(){
		if(tieneQueso && tieneSalsa)
		{
			return 32
		}
		if(tieneQueso){
			return 27
		}
		if(tieneSalsa)
		{
			return 25
		}
		return 20
	}
}

object roque {
	method entrenar(ave){
		ave.vola(10)
		ave.come(alpiste)
		ave.vola(5)
		ave.haceLoQueQuieras()
	}	
}
