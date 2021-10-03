
import 'package:equatable/equatable.dart';

abstract class CreateFormState extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class CreateInitialState extends CreateFormState{}

class LoadingState extends CreateFormState{}

class NameErrorState extends CreateFormState{
  final String? error;
  NameErrorState({this.error});
}
class IDErrorState extends CreateFormState{
  final String? error;
  IDErrorState({this.error});
}
class PhoneErrorState extends CreateFormState{
  final String? error;
  PhoneErrorState({this.error});
}
class HealthErrorState extends CreateFormState{
  final String? error;
  HealthErrorState({this.error});
}


class AddFormSuccessState extends CreateFormState{
}