import 'package:blocapicall/model/user_model.dart';
import 'package:blocapicall/repository/user_repo.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository = UserRepository();
  UserBloc() : super(const UserState()) {
    on<UserFetched>(_getAllUser);
  }

  void _getAllUser(UserFetched event, Emitter<UserState> emit) async {
    await userRepository.getAllUser().then((value) {
      emit(state.copyWith(
        userStatus: UserStatus.success,
        userList: value,
        message: 'success',
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
        userStatus: UserStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
