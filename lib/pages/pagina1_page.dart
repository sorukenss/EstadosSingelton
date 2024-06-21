import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          title: Text('Pagina 1'),
        ),
        body: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext contex, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Informacion_usuario(usuario: usuarioService.usuario)
                : Center(
                    child: Text("No hay informacion del usuario"),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'pagina2'),
          child: const Icon(Icons.accessibility_new),
        ),
      ),
    );
  }
}

class Informacion_usuario extends StatelessWidget {
  final Usuario? usuario;
  const Informacion_usuario({
    this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'General',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ListTile(
          title: Text('Nombre : ${usuario?.nombre} '),
        ),
        ListTile(
          title: Text('Edad : ${usuario?.edad}'),
        ),
        Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ListTile(
          title: Text('Profesion1 : '),
        ),
        ListTile(
          title: Text('Profesion2 : '),
        ),
      ]),
    );
  }
}
