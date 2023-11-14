import 'dart:convert';

import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/model/login.dart';
import 'package:telemedicine_pasien/repositories/login_email_repository.dart';
import 'package:telemedicine_pasien/repository_impl/login_email_repository_impl.dart';
import '../../injection_container.dart';
import 'package:equatable/equatable.dart';
import '../../utils/result.dart';
part 'login_email_state.dart';

class LoginEmailCubit extends Cubit<LoginEmailState> {
  final LoginEmailRepository _loginEmailRepository =
      sl<LoginEmailRepositoryImpl>();
  LoginEmailCubit() : super(const LoginEmailState());

  void init() {
    emit(const LoginEmailState());
  }

  void login([Map<String, dynamic>? params]) async {
    emit(state.copyWith(users: Result.loading()));
    final result = await _loginEmailRepository.login(params);

    result.fold((failure) {
      emit(
        state.copyWith(
          users: Result.error(failure.message!, state.users?.data),
        ),
      );
    }, (result) async {
      String encodeMap = json.encode(result);
      await sl<SharedPreferences>().setString('user', encodeMap);
      await sl<SharedPreferences>().setString('token', result.token!);
      await sl<SharedPreferences>().setString('name', result.name!);
      await sl<SharedPreferences>().setString('email', result.email!);
      await sl<SharedPreferences>().setString('phone', result.phone!);
      await sl<SharedPreferences>().setString('type', result.type!);
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(
        state.copyWith(
          users: Result.completed(result),
        ),
      );
    });
  }

  void getDataUser() {
    final result = sl<SharedPreferences>().getString('user');
    if (result != null) {
      final data = Login.fromJson(json.decode(result));
      emit(
        state.copyWith(
          userSP: Result.completed(data),
        ),
      );
    }
  }

  void logout() async {
    await sl<SharedPreferences>().clear();
    emit(const LoginEmailState());
  }
}
