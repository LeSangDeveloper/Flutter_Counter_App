import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(builder:
                (context, state) {
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
                listener: (context, state) => {
                  if (state.wasIncrement != null) {
                    if (state.wasIncrement!) {
                      debugPrint("increment")
                    }
                    else if (state.wasIncrement!) {
                      debugPrint("increment")
                    }
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(heroTag: "btn_add_thirdscreen", onPressed: () {BlocProvider.of<CounterCubit>(context).decrement();}, tooltip: 'Decrement', child: const Icon(Icons.remove), backgroundColor: Colors.purple),
                FloatingActionButton(heroTag: "btn_remove_thirdscreen", onPressed: () {BlocProvider.of<CounterCubit>(context).increment();}, tooltip: 'Increment', child: const Icon(Icons.add), backgroundColor: Colors.purple)
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
