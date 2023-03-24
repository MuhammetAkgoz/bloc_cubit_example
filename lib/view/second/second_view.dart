import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends BaseStatefulView<SecondView, SecondViewModel> {
  _SecondViewState() : super(viewModel: SecondViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: ViewStateBuilder<SecondState, SecondViewModel>(
        onLoading: (context) => Text('onLoading'),
        onSuccess: (context, state) => Text(state.screenStatus.name),
        onRefreshing: (context, state) => Text('onRefreshing'),
        onEmpty: (context) => Text('onEmpty'),
        onError: (context, error) => Text('onError'),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: BlocBuilder<SecondViewModel, SecondState>(
        builder: (context, state) {
          return Center(child: Text(state.args));
        },
      ),
    );
  }

  Widget buildTheme() {
    return BlocBuilder<SecondViewModel, SecondState>(
      builder: (context, state) => Center(
        child: GestureDetector(
          // onTap: () => reader.navigate(),
          child: Container(
            height: 100,
            width: 180,
            color: state.color,
          ),
        ),
      ),
    );
  }
}
