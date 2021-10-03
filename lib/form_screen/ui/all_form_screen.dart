import 'package:flutter/material.dart';
import 'package:safety_zone_mindx/create_form/ui/create_form_screen.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_zone_mindx/form_screen/bloc/all_form_state.dart';
class AllFormScreen extends StatelessWidget {
  const AllFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Declaration"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CreateFormScreen()
              ));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<AllFormBloc, AllFormState>(
        listener: (context, state){},
        buildWhen: (_, state){
          if (state is InitialState) return true;
          return false;
        },
        builder:(context, state){
          if (state is InitialState){
            return ListView.builder(
              itemCount: state.lists.length,
              itemBuilder: (context, position){
                return Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 20, right: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                              "name: ${state.lists[position].name}"),
                          margin: const EdgeInsets.only(
                              left: 10, top: 10),
                        ),
                        Container(
                          child: Text(
                              "health: ${state.lists[position].health}"),
                          margin: const EdgeInsets.only(
                              left: 10, top: 10),
                        )
                      ],
                    ));
              },
            );
      }
          return Container(child: Text(""),);
      },
      ),
    );
  }
}
