import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_in_action/view_model/counter_view_model.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Text(
            pow(context.read<CounterViewModel>().counter ?? 0, 2).toString()),
      ),
    );
  }
}
