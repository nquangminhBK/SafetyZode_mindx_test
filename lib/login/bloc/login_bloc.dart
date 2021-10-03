import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginInitialState());
  String phoneNumberInput = "";
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PhoneNumberChange){
      if (event.phoneNumber.isNotEmpty) {
        phoneNumberInput = event.phoneNumber!;
      }
    }
    if (event is PressLoginEvent){
      yield PressLoginState(phoneNumber: phoneNumberInput);
    }
  }


}