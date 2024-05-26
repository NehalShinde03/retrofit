import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_demo/model/user.dart';
import 'package:retrofit_demo/services/api_services.dart';

part 'home_state.dart';

part 'home_cubit.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  static const String routeName = '/home_ui.dart';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeState(
        controller: TextEditingController(),
      )),
      child: const HomeUi(),
    );
  }

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {

  // final Dio dio = Dio();
  // late final ApiServices apiServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context2) =>
          HomeCubit(HomeState(controller: TextEditingController())),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context2, state) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10, vertical: 10),
            child: Column(
              children: [
                TextField(
                  controller: state.controller,
                  decoration: const InputDecoration(
                    hintText: "search by id",
                  ),
                  onChanged: (val) {
                    val.isEmpty
                        ? context2.read<HomeCubit>().getAllData()
                        : context2
                            .read<HomeCubit>()
                            .getSingleData(int.parse(val));
                  },
                ),

                Expanded(
                      child: FutureBuilder<List<Data>>(
                        future: Future.value(state.list),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          print("data runtype ====> ${snapshot.runtimeType}");
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const Center(child: CircularProgressIndicator());
                          }
                          else if(snapshot.connectionState == ConnectionState.none){
                            return const Center(child: Text("No Connection Available"),);
                          }
                          else{
                            if(!snapshot.hasData){
                              return const Center(child: Text("Data not Found"));
                            }
                            else{
                              return ListView.builder(
                                itemCount: state.list.length,
                                itemBuilder: (context, index){
                                  return ListTile(
                                    leading: Text("${state.list[index].id}"),
                                    title: Text("${state.list[index].name}"),
                                    subtitle: Text("${state.list[index].email}"),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
