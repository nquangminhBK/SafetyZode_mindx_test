
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class PhoneNumberChange extends LoginEvent{
  final String phoneNumber;
  PhoneNumberChange({required this.phoneNumber});
}
class PressLoginEvent extends LoginEvent{}