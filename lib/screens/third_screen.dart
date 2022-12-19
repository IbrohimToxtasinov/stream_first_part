import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_in_action/view_model/counter_view_model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.number});
  final int number;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<CounterViewModel>().listenNumbers(number: widget.number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CounterViewModel(),
        builder: (context, child) {
          return Consumer<CounterViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  Center(child: Text(viewModel.counter.toString())),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterViewModel>().pauseCounterStream();
                      },
                      child: const Text("Pause Stream")),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterViewModel>().resumeCounterStream();
                      },
                      child: const Text("Resume Stream")),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterViewModel>().cancelCounterStream();
                      },
                      child: const Text("Cancel Stream")),
                ],
              );
            },
          );
        },
        child: Text(Provider.of<CounterViewModel>(context).counter.toString()),
      ),
    );
  }
}
