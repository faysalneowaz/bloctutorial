part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserStatus userStatus;
  final List<UserModel> userList;
  final String message;

  const UserState({
    this.userStatus = UserStatus.loading,
    this.userList = const <UserModel>[],
    this.message = '',
  });

  @override
  List<Object> get props => [userStatus, userList, message];

  UserState copyWith({
    UserStatus? userStatus,
    List<UserModel>? userList,
    String? message,
  }) {
    return UserState(
      userStatus: userStatus ?? this.userStatus,
      userList: userList ?? this.userList,
      message: message ?? this.message,
    );
  }
}
