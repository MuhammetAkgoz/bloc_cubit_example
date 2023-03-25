import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:bloc_cubit_example/product/theme/app_theme.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      /// Theme Provider
      BlocProvider<ThemeProvider>(lazy: false, create: (context) => ThemeProvider()),

      /// Page Provider
      // BlocProvider<FirstViewModel>(create: (context) => FirstViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      routerConfig: router,
      //routeInformationProvider: router.routeInformationProvider,
      //routeInformationParser: router.routeInformationParser,
      //routerDelegate: router.routerDelegate,
      theme: AppThemeBuilder.createTheme(LightAppTheme()),
      darkTheme: AppThemeBuilder.createTheme(DarkAppTheme()),
      themeMode: context.watch<ThemeProvider>().state.themeMode,
    );
  }
}
