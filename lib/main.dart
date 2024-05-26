import 'package:flutter/material.dart';
import 'package:retrofit_demo/ui/get_call/home_ui.dart';
import 'package:retrofit_demo/ui/post_call/post_call_ui.dart';
import 'package:retrofit_demo/ui/select_api_call/select_api_call_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: route,
      initialRoute: SelectApiCallUi.routeName,
    );
  }

  Map<String, WidgetBuilder> get route => <String, WidgetBuilder>{
    SelectApiCallUi.routeName:SelectApiCallUi.builder,
    HomeUi.routeName:HomeUi.builder,
    PostCallUi.routeName:PostCallUi.builder,
  };

}
