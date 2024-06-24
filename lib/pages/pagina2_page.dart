import 'package:estados/models/usuario.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
          title: usuarioService.existeUsuario
              ? Text("Nombre :${usuarioService.usuario.nombre}")
              : Text('Pagina 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                final newUser = new Usuario(
                    nombre: 'David',
                    edad: 25,
                    profesiones: ['fullstack developer', 'gamer']);
                usuarioService.usuario = newUser;
              },
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(35);
              },
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.agregarProfesion();
              },
              child: Text(
                'Cambiar Profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        )),
      ),
    );
  }
}
