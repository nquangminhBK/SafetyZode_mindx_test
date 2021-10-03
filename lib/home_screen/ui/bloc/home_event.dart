import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  final String timeInMilis =  DateTime.now().millisecondsSinceEpoch.toString();
  @override
  List<Object> get props => [timeInMilis];
}

class ClickFormDeclarationEvent extends HomeEvent{
}
class ClickQRCodeEvent extends HomeEvent{}