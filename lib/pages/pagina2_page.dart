import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UsuarioCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              final newUser = Usuario(
                  nombre: 'david',
                  edad: 34,
                  profesiones: ['full stack', 'gamer']);
              bloc.seleccionarUsuario(newUser);
            },
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              bloc.cambiarEdad(30);
            },
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              bloc.agregarProfesion();
            },
            child: Text(
              'Cambiar Profesion',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
