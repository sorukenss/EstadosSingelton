import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInicial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currenState = state;
    if (currenState is UsuarioActivo) {
      final newUser = currenState.usuario.copywith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currenState = state;
    if (currenState is UsuarioActivo) {
      final newProfesiones = [
        ...currenState.usuario.profesiones,
        'Profesion${currenState.usuario.profesiones.length + 1}'
      ];
      final newUser = currenState.usuario.copywith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInicial());
  }
}
