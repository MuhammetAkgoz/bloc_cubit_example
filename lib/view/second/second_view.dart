import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    print('second trigger');
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => context.push(Routes.third)),
      appBar: AppBar(title: const Text('Posts')),
      body: Text('a'),
    );
  }
}
