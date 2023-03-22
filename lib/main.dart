import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:bloc_cubit_example/product/theme/app_theme.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        /// Theme Provider
        BlocProvider<ThemeProvider>(lazy: false, create: (context) => ThemeProvider()),

        /// View Providers
        BlocProvider<FirstViewModel>(create: (context) => FirstViewModel()),
        BlocProvider<SecondViewModel>(create: (context) => SecondViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      navigatorKey: NavigationHandler.instance.navigatorKey,
      onGenerateRoute: NavigationGenerator.onGenerateRoute,
      theme: AppThemeBuilder.createTheme(LightAppTheme()),
      darkTheme: AppThemeBuilder.createTheme(DarkAppTheme()),
      themeMode: context.watch<ThemeProvider>().state.themeMode,
    );
  }
}
