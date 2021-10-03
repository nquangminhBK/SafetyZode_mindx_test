import 'package:equatable/equatable.dart';

abstract class CreateFormEvent extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}
class InitialEvent extends CreateFormEvent{}

class NameChangeEvent extends CreateFormEvent{
  final String? content;
  NameChangeEvent({this.content});
}

class PhoneChangeEvent extends CreateFormEvent{
  final String? content;
  PhoneChangeEvent({this.content});
}

class IDChangeEvent extends CreateFormEvent{
  final String? content;
  IDChangeEvent({this.content});
}

class HealthChangeEvent extends CreateFormEvent{
  final String? content;
  HealthChangeEvent({this.content});
}

class PressRegisterEvent extends CreateFormEvent{
}