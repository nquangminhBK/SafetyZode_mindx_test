import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class PressFormState extends HomeState{}
class HomeInitialState extends HomeState{}