import 'dart:io';
import 'package:flutter/material.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_bloc.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_event.dart';
import 'package:safety_zone_mindx/form_screen/ui/all_form_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Safety Zone"), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.qr_code),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('QR code function')));
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is PressFormState){
              BlocProvider.of<AllFormBloc>(context)
                  .add(AllFormInitialEvent());
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AllFormScreen()
              ));
            }
          },
          child: IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context)
                    .add(ClickFormDeclarationEvent());
              },
              icon: const Icon(Icons.format_align_justify)),
        )
      ]),
      body: const SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://bando.tphcm.gov.vn/ogis',
        ),
      ),
    );
  }
}
