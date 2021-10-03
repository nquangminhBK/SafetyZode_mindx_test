import 'dart:async';

import 'package:hive/hive.dart';
import 'package:safety_zone_mindx/data/models/form.dart';

class FormRepository{
  String boxName = "Form";
  // open a box
  Future<Box> formBox() async {
    var box = await Hive.openBox<Form>(boxName);
    return box;
  }

  Future<List<Form>> getAllForm() async {
    final box = await formBox();
    List forms = box.values.toList();
    return forms as List<Form>;
  }

  Future<void> addToBox(Form form) async {
    final box = await formBox();
    await box.put(form.formId, form);
  }

  Future<void> deleteFromBox(String formId) async {
    final box = await formBox();
    await box.delete(formId);
  }

  Future<void> deleteAll() async {
    final box = await formBox();
    await box.clear();
  }

  Future<Form> getFormById(String formId) async {
    final box = await formBox();
    Form user = box.get(formId);
    return user;
  }
}