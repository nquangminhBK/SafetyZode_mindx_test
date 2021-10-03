
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}
class LoginInitialState extends LoginState{}
class PressLoginState extends LoginState{
  final String phoneNumber;
  PressLoginState({required this.phoneNumber});
}