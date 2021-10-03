import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_zone_mindx/home_screen/ui/home_screen.dart';
import 'package:safety_zone_mindx/login/bloc/login_bloc.dart';
import 'package:safety_zone_mindx/login/bloc/login_event.dart';
import 'package:safety_zone_mindx/login/bloc/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _codeController = TextEditingController();
  //Place A
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async  {
        if (state is LoginInitialState){

        }
        if (state is PressLoginState){
         await loginUser(state.phoneNumber, context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onChanged: (text){
                    BlocProvider.of<LoginBloc>(context).add(PhoneNumberChange(phoneNumber: text));
                  },
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Phone Number"),
                  controller: _phoneController,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("Login"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(PressLoginEvent());
                    },
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  Future<void> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user!;

          if(user != null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeScreen()
            ));
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth.signInWithCredential(credential);

                        User user = result.user!;

                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: (_){},
    );
  }
}
