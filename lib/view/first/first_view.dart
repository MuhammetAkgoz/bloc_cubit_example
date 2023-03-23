import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/first/first_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends BaseStatefulView<FirstView, FirstViewModel> {
  _FirstViewState() : super(viewModel: FirstViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => reader.navigate()),
      appBar: AppBar(title: const Text('First Screem')),
      body: BlocBuilder<FirstViewModel, FirstState>(builder: (context, state) {
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
