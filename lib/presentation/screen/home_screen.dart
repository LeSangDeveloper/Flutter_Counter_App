import 'package:counterapp/presentation/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                style: const TextStyle(
                  fontSize: 40,
                  textBaseline: TextBaseline.alphabetic
                ),
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
                FloatingActionButton(heroTag: "btn_add_home_screen", onPressed: () {BlocProvider.of<CounterCubit>(context).decrement();}, tooltip: 'Decrement', child: const Icon(Icons.remove),),
                FloatingActionButton(heroTag: "btn_move_home_screen", onPressed: () {BlocProvider.of<CounterCubit>(context).increment();}, tooltip: 'Increment', child: const Icon(Icons.add),)
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton( color: Colors.red, textColor: Colors.white, onPressed: () {Navigator.of(context).pushNamed("/second");}, child: const Text("Go to Second Screen")),
            MaterialButton(color: Colors.purple, textColor: Colors.white, onPressed: () {Navigator.of(context).pushNamed("/third");}, child: const Text("Go to Third Screen"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
