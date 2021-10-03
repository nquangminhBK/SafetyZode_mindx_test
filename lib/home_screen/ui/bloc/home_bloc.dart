import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_zone_mindx/home_screen/ui/bloc/home_event.dart';
import 'package:safety_zone_mindx/home_screen/ui/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeInitialState());
  String phoneNumberInput = "";
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ClickFormDeclarationEvent){
      yield PressFormState();
    }
  }


}