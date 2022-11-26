import 'dart:developer';

import 'package:counterapp/presentation/screen/home_screen.dart';
import 'package:counterapp/presentation/screen/second_screen.dart';
import 'package:counterapp/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  final CounterCubit _counterCubit = CounterCubit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(title: 'Flutter Demo Home Page', color: Colors.blue),
          ),
          '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(title: 'Second Screen', color: Colors.red),
          ),
          '/third': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(title: 'Third Screen', color: Colors.purple),
          ),
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterCubit.close();
  }

}