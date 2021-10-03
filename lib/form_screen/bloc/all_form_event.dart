import 'package:equatable/equatable.dart';

abstract class AllFormEvent extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class AllFormInitialEvent extends AllFormEvent{}