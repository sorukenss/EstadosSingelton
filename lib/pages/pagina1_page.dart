import 'package:estados/models/usuario.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:estados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
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
          title: Text('Pagina 1'),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  usuarioService.removerUsuario();
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: usuarioService.existeUsuario
            ? Informacion_usuario(usuario: usuarioService.usuario)
            : const Center(child: Text('No existe ningun Usuario registrado')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'pagina2'),
          child: const Icon(Icons.accessibility_new),
        ),
      ),
    );
  }
}

class Informacion_usuario extends StatelessWidget {
  final Usuario usuario;
  const Informacion_usuario({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'General',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ListTile(
          title: Text('Nombre : ${usuario.nombre}'),
        ),
        ListTile(
          title: Text('Edad : ${usuario.edad} '),
        ),
        const Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ...usuario.profesiones!
            .map((profesion) => ListTile(
                  title: Text(profesion),
                ))
            .toList()
      ]),
    );
  }
}
