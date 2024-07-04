import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
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
              usuarioCtrl.cargarUsuario(Usuario(
                  nombre: 'david',
                  edad: 35,
                  profesiones: ['gamer', 'fullstack developer']));
              Get.snackbar('Usuario establecido', 'fernando es su nombre',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                    )
                  ]);
            },
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              usuarioCtrl.cambiarEdad(25);
            },
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              // usuarioCtrl.agregarProfesion(
              //     'profesion #${usuarioCtrl.user.value.profesiones!.length + 1}');
              usuarioCtrl.agregarProfesion(
                  'profesion #${usuarioCtrl.profesionesCount + 1}');
            },
            child: Text(
              'Agregar Profesion',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Text(
              'Cambiar tema',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
