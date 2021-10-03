import 'package:flutter/material.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_bloc.dart';
import 'package:safety_zone_mindx/data/repository/form_repository.dart';
import 'package:safety_zone_mindx/home_screen/ui/home_screen.dart';
import 'package:safety_zone_mindx/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/models/form.dart';
import 'form_screen/bloc/all_form_bloc.dart';
import 'home_screen/ui/bloc/home_bloc.dart';
import 'login/bloc/login_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(FormAdapter());
  runApp(MultiBlocProvider(
    providers: [

      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(),
      ),
      BlocProvider<CreateFormBloc>(
        create: (BuildContext context) => CreateFormBloc(FormRepository()),
      ),
      BlocProvider<AllFormBloc>(
        create: (BuildContext context) => AllFormBloc(FormRepository()),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginScreen(),
    );
  }
}


