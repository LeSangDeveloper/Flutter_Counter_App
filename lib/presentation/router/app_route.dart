import 'package:counterapp/logic/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/home_screen.dart';
import '../screen/second_screen.dart';
import '../screen/third_screen.dart';

class AppRouter {

  Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(title: 'Flutter Demo Home Page', color: Colors.blue));
      case '/second':
        return MaterialPageRoute(
            builder: (_) =>  const SecondScreen(title: 'Second Screen', color: Colors.red));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(title: 'Third Screen', color: Colors.purple));
      default:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(title: 'Flutter Demo Home Page', color: Colors.blue));
    }
  }

}