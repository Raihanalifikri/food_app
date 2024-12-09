part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();
}

final class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

final class UserLoaded extends UserState{

  final Users users;

  UserLoaded(this.users);

  @override
  List<Object?> get props => [users];
}


final class UserLoadingFailed extends UserState{
  final String message;

  UserLoadingFailed(this.message);


  @override
  List<Object?> get props => [message];
}