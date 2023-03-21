import 'package:bloc_cubit_example/example/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  void initState() {
    super.initState();
    context.read<ExampleViewModel>().get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example App')),
      body: BlocBuilder<ExampleViewModel, ExampleState>(
        builder: (context, state) => state.serviceState != ServiceState.success
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: state.model.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.model[index].title ?? ''),
                  subtitle: Text(state.model[index].body ?? ''),
                ),
              ),
      ),
    );
  }
}
