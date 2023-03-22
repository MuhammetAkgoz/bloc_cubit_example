import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FirstViewModel>(create: (context) => FirstViewModel()),
    BlocProvider<SecondViewModel>(create: (context) => SecondViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: NavigationHandler.instance.navigatorKey,
      onGenerateRoute: (routeSettings) => NavigationGenerator.onGenerateRoute(routeSettings),
    );
  }
}
