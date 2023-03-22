import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends BaseStatefulView<SecondView, SecondViewModel> {
  _SecondViewState() : super(viewModel: SecondViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Screen')),
        body: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: ElevatedButton(onPressed: () => context.read<ThemeProvider>().change(), child: const Text('click')),
          ),
        ));
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
}
