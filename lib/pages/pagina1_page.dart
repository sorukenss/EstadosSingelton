import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? Informacion_usuario(
              usuario: usuarioCtrl.user.value,
            )
          : const NoInformacion()),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        onPressed: () => Get.to(Pagina2Page()),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class NoInformacion extends StatelessWidget {
  const NoInformacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('No hay Usuario Seleccionado'),
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
          title: Text('Edad : ${usuario.edad}'),
        ),
        const Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ...usuario.profesiones!
            .map((profesiones) => ListTile(
                  title: Text(profesiones),
                ))
            .toList(),
      ]),
    );
  }
}
