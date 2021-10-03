import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_event.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_state.dart';
import 'package:safety_zone_mindx/data/models/form.dart';
import 'package:safety_zone_mindx/data/repository/form_repository.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_event.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_state.dart';

class AllFormBloc extends Bloc<AllFormEvent, AllFormState> {
  final FormRepository formRepository;


  AllFormBloc(this.formRepository) : super(InitialState(lists: List.empty()));

  @override
  Stream<AllFormState> mapEventToState(AllFormEvent event) async* {
    if (event is AllFormInitialEvent) {
      final list = await formRepository.getAllForm();
      yield InitialState(lists: list);
    }
  }
}