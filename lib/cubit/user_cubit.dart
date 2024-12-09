import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<Users> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> singUp(Users user, String password, {File? pictureFile}) async {
    ApiReturnValue<Users> result =
        await UserServices.singUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile)
  async {
    ApiReturnValue<String> result =
        await UserServices.uploadPicturePath(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).users.copyWith(
        picturePath: 'https://food.rtid73.com/storage/${result.value}'
      )));
    }
  }

  Future<void> singOut() async {
    ApiReturnValue<bool> result = await UserServices.logout();
    if(result.value != null) {
      emit(UserInitial());
    }
    else{
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> getUser(Users users) async{
    ApiReturnValue<Users> result = await UserServices.getUser(users);

    if(result.value != null){
      emit(UserLoaded(result.value!));
    } else{
      emit(UserLoadingFailed(result.message!));
    }
  }
}
