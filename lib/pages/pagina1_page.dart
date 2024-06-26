import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UsuarioCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              bloc.borrarUsuario();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInicial:
            return Center(
              child: Text('No hay informacion del usuario'),
            );

          case UsuarioActivo:
            return Informacion_usuario(
                usuario: (state as UsuarioActivo).usuario);

          default:
            return Center(
              child: Text('estado no reconocido'),
            );
        }
        // if (state is UsuarioInicial) {
        //   return Center(
        //     child: Text('no hay usuario inicial'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   return Informacion_usuario(
        //     usuario: state.usuario,
        //   );
        // } else {
        //   return Center(
        //     child: Text('estado no reconocido'),
        //   );
        // }
      },
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
        Text(
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
            .toList()
      ]),
    );
  }
}
