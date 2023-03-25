import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends BaseStatefulView<SecondView, SecondViewModel> {
  _SecondViewState() : super(viewModel: SecondViewModel());

  @override
  Widget build(BuildContext context) {
    print('second trigger');
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => reader.navigate()),
      appBar: AppBar(title: Text(reader.appTitle)),
      body: ViewStateBuilder<SecondViewModel, SecondState>(
        onSuccess: (context, state) => Text(state.color.toString()),
      ),
    );
  }
}
