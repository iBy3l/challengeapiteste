import 'package:apiteste/services/user_failure.dart';
import 'package:apiteste/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc(
    this.userService,
  ) : super(UserLoading()) {
    on<GetUsersEvent>(getUsers);
  }

  getUsers(event, emit) async {
    try {
      emit(UserLoading());
      final users = await userService.getUsers();
      emit(
        UserLoaded(
          users: users,
        ),
      );
    } on UserFailure {
      emit(
        const UserError(
          message: 'Erro ao carregar usuários',
        ),
      );
    }
  }
}
