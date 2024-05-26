import 'package:flutter/material.dart';
import 'package:retrofit_demo/ui/get_call/home_ui.dart';
import 'package:retrofit_demo/ui/post_call/post_call_ui.dart';

class SelectApiCallUi extends StatefulWidget {
  const SelectApiCallUi({super.key});

  static const String routeName = "/select_api_call.dart";
  static Widget builder(BuildContext context) => const SelectApiCallUi();


  @override
  State<SelectApiCallUi> createState() => _SelectApiCallUiState();
}

class _SelectApiCallUiState extends State<SelectApiCallUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: () => Navigator.pushNamed(context, HomeUi.routeName), child: Text("GET")),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, PostCallUi.routeName), child: Text("POST")),
            ElevatedButton(onPressed: (){}, child: Text("PUT")),
            ElevatedButton(onPressed: (){}, child: Text("PATCH")),
            ElevatedButton(onPressed: (){}, child: Text("DELETE")),

          ],
        ),
      ),
    );
  }
}
