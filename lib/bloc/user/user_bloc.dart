import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChageUserAge>((event, emit) {
      if (!state.exisUser) return;

      emit(UserSetState(state.usuario!.copyWith(edad: event.age)));
    });

    on<ChangeUserProfesion>((event, emit) {
      if (!state.exisUser) return;

      final professions = [...state.usuario!.profesiones, event.profe];
      emit(UserSetState(state.usuario!.copyWith(profesiones: professions)));
    });
  }
}
