import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          title: StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData
                  ? Text('Nombre: ${snapshot.data!.nombre}')
                  : Text('Pagina 2');
            },
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = new Usuario(
                    nombre: 'isaac',
                    edad: 45,
                    profesiones: ['admin', 'locutor']);

                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {},
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
