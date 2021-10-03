
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_event.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_state.dart';
import 'package:safety_zone_mindx/data/models/form.dart';
import 'package:safety_zone_mindx/data/repository/form_repository.dart';

class CreateFormBloc extends Bloc<CreateFormEvent, CreateFormState> {
  final FormRepository formRepository;
  String nameInput = "";
  String idInput = "";
  String phoneInput = "";
  String healthInput = "";

  CreateFormBloc(this.formRepository) : super(CreateInitialState());

  @override
  Stream<CreateFormState> mapEventToState(CreateFormEvent event) async* {
    if (event is NameChangeEvent) {
      if (event.content != null) nameInput = event.content!;
      yield NameErrorState(error: null);
    }
    if (event is IDChangeEvent) {
      if (event.content != null) idInput = event.content!;
      yield IDErrorState(error: null);
    }
    if (event is PhoneChangeEvent) {
      if (event.content != null) phoneInput = event.content!;
      yield PhoneErrorState(error: null);
    }
    if (event is HealthChangeEvent) {
      if (event.content != null) healthInput = event.content!;
      yield HealthErrorState(error: null);
    }
    if (event is PressRegisterEvent) {

      yield* mapPressRegisterEventToState();
    }
  }

  Stream<CreateFormState> mapPressRegisterEventToState() async* {
    yield LoadingState();
    if (nameInput.isEmpty) {
      yield NameErrorState(error: "please input your name");
      return;
    }
    if (phoneInput.isEmpty) {
      yield PhoneErrorState(error: "please input your phone number");
      return;
    }
    if (idInput.isEmpty) {
      yield IDErrorState(error: "please input your ID");
      return;
    }
    if (healthInput.isEmpty) {
      yield HealthErrorState(error: "please input your health");
      return;
    }

    await formRepository.addToBox(Form(
        formId: DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        name: nameInput, phone: phoneInput, cmnd: idInput, health: healthInput));
    yield AddFormSuccessState();
    return;
  }
}