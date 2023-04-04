import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:flutter/material.dart';
import 'package:odin/base/base_stateful_view.dart';
import 'package:odin/base/view/view_state_builder.dart';

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
      body: ViewStateBuilder(onSuccess: (context, state) {
        print('view state2 calisti');
        return Center();
      }),
    );
  }
}
