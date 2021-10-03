import 'package:equatable/equatable.dart';
import 'package:safety_zone_mindx/data/models/form.dart';

abstract class AllFormState extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class InitialState extends AllFormState{
  final List<Form> lists;
  InitialState({required this.lists});
}