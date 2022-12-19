import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_in_action/screens/main_screen.dart';
import 'package:stream_in_action/view_model/counter_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
