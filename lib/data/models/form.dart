import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'form.g.dart';

@HiveType(typeId: 2)
class Form {
  @HiveField(0)
  String formId;
  @HiveField(1)
  String name = "";
  @HiveField(2)
  String phone = "";
  @HiveField(3)
  String cmnd = "";
  @HiveField(4)
  String health = "";
  Form(
      {this.formId="",
        this.name="",
        this.phone = "",
        this.cmnd = "",
        this.health = "",
      });

}