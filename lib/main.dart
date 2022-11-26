import 'dart:developer';

import 'package:counterapp/presentation/router/app_route.dart';
import 'package:counterapp/presentation/screen/home_screen.dart';
import 'package:counterapp/presentation/screen/second_screen.dart';
import 'package:counterapp/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _router = AppRouter();
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
        onGenerateRoute: _router.onGeneratorRoute,
      ),
    );
  }

}