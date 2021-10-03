import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_bloc.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_event.dart';
import 'package:safety_zone_mindx/create_form/bloc/create_form_state.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_bloc.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_event.dart';

import '../../toast_util.dart';
class CreateFormScreen extends StatelessWidget {
  const CreateFormScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          //onPressed:() => Navigator.pop(context, false),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
            child: BlocConsumer<CreateFormBloc, CreateFormState>(
              listener: (context, state){
                if (state is AddFormSuccessState){
                  MyToast.showToast("Register successfully");
                  BlocProvider.of<AllFormBloc>(context)
                      .add(AllFormInitialEvent());
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state){
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        onChanged: (text) {
                          BlocProvider.of<CreateFormBloc>(context)
                              .add(NameChangeEvent(content: text));
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                            errorText: (state is NameErrorState && state.error!=null && state.error!.isNotEmpty)? state.error: null ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Name',
                            labelStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        maxLines: 1,
                        onChanged: (text) {
                          BlocProvider.of<CreateFormBloc>(context)
                              .add(PhoneChangeEvent(content: text));
                        },
                        decoration: InputDecoration(
                            errorText: (state is PhoneErrorState && state.error!=null && state.error!.isNotEmpty)? state.error: null ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'phone number',
                            labelStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        maxLines: 1,
                        onChanged: (text) {
                          BlocProvider.of<CreateFormBloc>(context)
                              .add(IDChangeEvent(content: text));
                        },
                        decoration: InputDecoration(
                            errorText: (state is IDErrorState && state.error!=null && state.error!.isNotEmpty)? state.error: null ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'ID',
                            labelStyle: const TextStyle(color: Colors.black)
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        maxLines: 1,
                        onChanged: (text) {
                          BlocProvider.of<CreateFormBloc>(context)
                              .add(HealthChangeEvent(content: text));
                        },
                        decoration: InputDecoration(
                            errorText: (state is HealthErrorState && state.error!=null && state.error!.isNotEmpty)? state.error: null ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Health',
                            labelStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          margin: const EdgeInsets.all(20),
                          height: 50.0,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<CreateFormBloc>(context)
                                  .add(PressRegisterEvent());
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              primary: Colors.black,
                              side: const BorderSide(color: Colors.white, width: 1),
                            ),
                            child: const Text(
                              "Declare",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                );
              },
            )


        ),
      ),
    );
  }
}
