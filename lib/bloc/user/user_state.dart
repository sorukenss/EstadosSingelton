part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool exisUser;
  final Usuario? usuario;

  const UserState({this.exisUser = false, this.usuario});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(exisUser: false, usuario: null);
}

class UserSetState extends UserState {
  final Usuario user;
  const UserSetState(this.user) : super(exisUser: true, usuario: user);
}
