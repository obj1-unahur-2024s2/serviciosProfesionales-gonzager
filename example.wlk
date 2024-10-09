class Universidad {
  const property provincia
  var property honorarios
  var donaciones= 0
  method recibirDonaciones(unImporte){
    donaciones += unImporte
  }
}

class AsociadoAUniversidad{
  const property universidad
  method honorarios() {
    return universidad.honorarios()
  }
  method puedeTrabajar() {
    return [universidad.provincia()]
  }

  method cobrar(unImporte){
    universidad.recibirDonaciones(unImporte*0.5)
  }
}

class AsociadoAlLitoral {
  const property universidad
  method honorarios() = 3000
  method puedeTrabajar() = ["Entre Rios", "Santa Fe", "Corrientes"]
  method cobrar(unImporte){
    asociacionProfesionalesDelLitoral.recudar(unImporte)
  }
}

class Libre {
  const property universidad
  var property puedeTrabajar
  var property honorarios

  method cobrar(unImporte){
    
  }
}


class Empresa {
  const property profesionales =[]
  var property honorariosRefencia
  method agregarProfesion(unProfesional) {
    profesionales.add(unProfesional)
  }

  method cuantos(unaUniversidad) {
    return profesionales.count({p=>p.universidad()==unaUniversidad})
  }

  method caros() {
    return profesionales.filter({p=>p.honorarios()>honorariosRefencia})
  }

  method formadoras() {
    return profesionales.map({p=>p.universidad()}).asSet()
  }

  method masBarato() {
    return profesionales.min({p=>p.honorarios()})
  }

  method esDeGenteAcontada() {
    return not profesionales.any( {p => p.puedeTrabajar().size() > 3})
    //return profesionales.all( { p=> p.puedeTrabajar().size() <= 3})
  }

  method puedeSatisfacer(unSolicitante) {
    return profesionales.any({p=> unSolicitante.puedeSerAtendidoPor(p)})
  }


}

class SolicitantePersona {
  var property provincia
  method puedeSerAtendidoPor(unProfesional){
    return unProfesional.puedeTrabajar().contains(provincia)
  }
}

class SolicitanteInstitucion {
  var property universidades
  method puedeSerAtendidoPor(unProfesional){
    universidades.contains(unProfesional.universidad())
  }
}

class SolicitanteClub {
  var property provincias
  method puedeSerAtendidoPor(unProfesional){
    return not provincias.asSet().intersection(
      unProfesional.puedeTrabajar().asSet()
      ).isEmpty()
  }

  method puedeSerAtendidoPor2(unProfesional){
    return provincias.any({
      pcias=> unProfesional.puedeTrabajar().contains(pcias)
    })
  }
}

object asociacionProfesionalesDelLitoral{
  var recaudacion = 0
  method recudar(unImporte) {
    recaudacion += unImporte
  }
}