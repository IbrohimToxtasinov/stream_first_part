import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_in_action/view_model/counter_view_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Text("${(context.read<CounterViewModel>().counter ?? 0).toString().length}")),
    );
  }
}