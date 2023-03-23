import 'package:bloc_cubit_example/core/base/base_stateless_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:bloc_cubit_example/view/third/third_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdView extends BaseStatelessView<ThirdViewModel> {
  ThirdView({super.key}) : super(viewModel: ThirdViewModel());

  @override
  Widget build(BuildContext context) {
    print('third trigger');

    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(heroTag: 'tag1', onPressed: () => reader(context).increment(), child: const Icon(Icons.add)),
            const SizedBox(height: 20),
            FloatingActionButton(heroTag: 'tag2', onPressed: () => reader(context).decrement(), child: const Icon(Icons.remove)),
          ],
        ),
        appBar: AppBar(title: const Text('Third Screen')),
        body: BlocBuilder<ThirdViewModel, ThirdState>(
          builder: (context, state) => Center(child: Text(state.number.toString())),
        ));
  }
}
