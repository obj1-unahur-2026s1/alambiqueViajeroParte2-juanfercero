import elAlambiqueViajero.*

object centroDeInscripcion {
  const inscriptos = []
  const rechazados = []
  var ciudadDeLaCarrera = paris
  const vehiculosQueLlegaronALaCarrera = []
  var ultimoGanador = alambiqueVeloz


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

    method avisarDeLaRealizacionDeLaCarrera() {
        inscriptos.forEach({vehiculo => if(ciudadDeLaCarrera.puedeLlegar(vehiculo)) {
                vehiculosQueLlegaronALaCarrera.add(vehiculo)
                vehiculo.desgaste()
        }})
    }

    method realizarCarrera() {
        const vehiculosQueTerminaronLaCarrera = []

        self.avisarDeLaRealizacionDeLaCarrera()
        vehiculosQueLlegaronALaCarrera.forEach({vehiculo => if(ciudadDeLaCarrera.puedeLlegar(vehiculo)) {
                vehiculosQueTerminaronLaCarrera.add(vehiculo)
                vehiculo.desgaste()
        }})

        inscriptos.clear()
        rechazados.clear()
        vehiculosQueLlegaronALaCarrera.clear()
        if(vehiculosQueTerminaronLaCarrera.size() > 0) {
            ultimoGanador = vehiculosQueTerminaronLaCarrera.anyOne()
        }
    }

    method ganador() = ultimoGanador
}
