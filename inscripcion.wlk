import elAlambiqueViajero.*

object centroDeInscripcion {
  const inscriptos = []
  const rechazados = []
  var ciudadDeLaCarrera = paris


  method inscriptos() = inscriptos
  method rechazados() = rechazados

  method recibirVehiculo(vehiculo) {
    if(ciudadDeLaCarrera.puedeLlegar(vehiculo)){
        inscriptos.add(vehiculo)
    } else {
        rechazados.add(vehiculo)
    }
  }
  method cambiarCiudad(nuevaCiudad) {
    const aux = inscriptos + rechazados 

    ciudadDeLaCarrera = nuevaCiudad
    inscriptos.clear()
    rechazados.clear()
    aux.forEach({vehiculo => self.recibirVehiculo(vehiculo)})
    }
}