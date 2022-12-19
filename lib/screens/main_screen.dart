import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_in_action/screens/First_screen.dart';
import 'package:stream_in_action/screens/second_screen.dart';
import 'package:stream_in_action/screens/third_screen.dart';
import 'package:stream_in_action/view_model/counter_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asosiy Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              onFieldSubmitted: (value) {
                context.read<CounterViewModel>().counter = int.parse(value);
              },
              controller: controller,
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.withOpacity(0.5),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const FirstScreen()));
              },
              child: const Text("First screen")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const SecondScreen()));
              },
              child: const Text("Second screen")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            ThirdScreen(number: int.parse(controller.text))));
              },
              child: const Text("Third screen")),
        ],
      ),
    );
  }
}
