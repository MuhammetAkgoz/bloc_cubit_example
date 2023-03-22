import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/example/example_state.dart';
import 'package:bloc_cubit_example/example/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Own
// build call:watcher => 3
// build call: watcher with read => 2
// build call: state => 1
// build call: read by state => 0

/// Doc
// build call:watcher => 1
// build call: watcher with read => 0
// build call: state => 1
// build call: read by state => 0

class ExampleView extends StatefulWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends BaseStatefulView<ExampleView, ExampleViewModel> {
  _ExampleViewState() : super(viewModel: ExampleViewModel());

  @override
  Widget build(BuildContext context) {
    print('builder-trigger');
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => reader.get()),
      appBar: AppBar(title: const Text('Example App')),
      body: BlocBuilder<ExampleViewModel, ExampleState>(builder: (context, state) {
        print('bloc builder trigger');
        return state.serviceState != ServiceState.success
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: state.model.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.model[index].title ?? ''),
                  subtitle: Text(state.model[index].body ?? ''),
                ),
              );
      }),
    );
  }
}
