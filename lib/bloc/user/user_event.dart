part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}

class ChageUserAge extends UserEvent {
  final int age;
  ChageUserAge(this.age);
}

class ChangeUserProfesion extends UserEvent {
  final String profe;
  ChangeUserProfesion(this.profe);
}

class DeleteUser extends UserEvent {}
