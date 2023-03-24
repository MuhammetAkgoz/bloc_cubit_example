import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:flutter/material.dart';

class ThirdView extends StatefulWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  State<ThirdView> createState() => _ThirdViewState();
}

class _ThirdViewState extends BaseStatefulView<ThirdView, ThirdViewModel> {
  _ThirdViewState() : super(viewModel: ThirdViewModel());

  @override
  Widget build(BuildContext context) {
    print('third trigger');
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(heroTag: 'tag1', onPressed: () => reader.increment(), child: const Icon(Icons.add)),
            const SizedBox(height: 20),
            FloatingActionButton(heroTag: 'tag2', onPressed: () => reader.decrement(), child: const Icon(Icons.remove)),
          ],
        ),
        appBar: AppBar(title: const Text('Third Screen')),
        body: Center());
  }
}
