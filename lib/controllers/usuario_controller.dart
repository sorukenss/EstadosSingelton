import 'package:get/get.dart';

import 'package:estados/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var user = Usuario().obs;

  int get profesionesCount {
    return user.value.profesiones!.length;
  }

  void cargarUsuario(Usuario puser) {
    this.existeUsuario.value = true;
    this.user.value = puser;
  }

  void cambiarEdad(int edad) {
    user.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    this.user.update((val) {
      val!.profesiones = [...val.profesiones!, profesion];
    });
  }
}
