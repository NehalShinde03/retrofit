import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_demo/model/user.dart';
import 'package:retrofit_demo/services/api_services.dart';

part 'post_call_state.dart';

part 'post_call_cubit.dart';

class PostCallUi extends StatefulWidget {
  const PostCallUi({super.key});

  static const String routeName = '/post_call_ui.dart';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostCallCubit(PostCallState(
              idController: TextEditingController(),
              nameController: TextEditingController(),
              emailController: TextEditingController(),
              genderController: TextEditingController(),
              statusController: TextEditingController()
          )),
      child: const PostCallUi(),
    );
  }

  @override
  State<PostCallUi> createState() => _PostCallUiState();
}

class _PostCallUiState extends State<PostCallUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => PostCallCubit(PostCallState(
                            idController: TextEditingController(),
                            nameController: TextEditingController(),
                            emailController: TextEditingController(),
                            genderController: TextEditingController(),
                            statusController: TextEditingController()
                        )),
                        child: BlocBuilder<PostCallCubit, PostCallState>(
                          builder: (context, state) {
                            return AlertDialog(
                              title: const Text("Add"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: state.idController,
                                    ),
                                    TextField(
                                      controller: state.nameController,
                                    ),
                                    TextField(
                                      controller: state.emailController,
                                    ),
                                    TextField(
                                      controller: state.genderController,
                                    ),
                                    TextField(
                                      controller: state.statusController,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () => context.read<PostCallCubit>().postData({
                                      "id" : state.idController.text,
                                      "name" : state.nameController.text,
                                      "email" : state.emailController.text,
                                      "gender" : state.genderController.text,
                                      "status" : state.statusController.text
                                    }),
                                    child: Text("Ok"),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: BlocBuilder<PostCallCubit, PostCallState>(
          builder: (context2, state) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 10, vertical: 10),
              child: FutureBuilder<List<Data>>(
                future: Future.value(state.list),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print("data runtype ====> ${snapshot.runtimeType}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: Text("No Connection Available"),);
                  }
                  else {
                    if (!snapshot.hasData) {
                      return const Center(child: Text("Data not Found"));
                    }
                    else {
                      return ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
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
            );
          },
        ));
  }
}
