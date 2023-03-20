import 'package:bloc_cubit_example/example/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example App')),
      body: BlocBuilder<ExampleViewModel, ExampleState>(
        builder: (context, state) => Center(child: Text(state.number.toString())),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () => context.read<ExampleViewModel>().increase()),
          const SizedBox(height: 20),
          FloatingActionButton(child: const Icon(Icons.remove), onPressed: () => context.read<ExampleViewModel>().decrease()),
        ],
      ),
    );
  }
}
