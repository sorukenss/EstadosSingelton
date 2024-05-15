import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Informacion_usuario(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class Informacion_usuario extends StatelessWidget {
  const Informacion_usuario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'General',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(),
        ListTile(
          title: Text('Nombre : '),
        ),
        ListTile(
          title: Text('Edad : '),
        ),
        Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(),
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
