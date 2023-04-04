import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/first/first_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odin/base/base_stateful_view.dart';
import 'package:odin/base/view/view_state_builder.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends BaseStatefulView<FirstView, FirstViewModel> {
  _FirstViewState() : super(viewModel: FirstViewModel());

  @override
  Widget build(BuildContext context) {
    print('first trigger');
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () => reader.navigate()),
        appBar: AppBar(title: const Text('First Screem')),
        body: ViewStateBuilder(onSuccess: (context, __) {
          print('view state builder');
          return Column(
            children: [
              ElevatedButton(onPressed: reader.change, child: const Text('klass')),
              BlocBuilder<FirstViewModel, FirstState>(
                  builder: (context, state) => TextWidget2(text: watcher(context).state.number.toString())),
              BlocBuilder<FirstViewModel, FirstState>(
                  builder: (context, state) => TextWidget2(text: watcher(context).state.name)),
            ],
          );
        }));
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    print('${widget.text} widget calisti');
    return Text(widget.text);
  }
}

class TextWidget2 extends StatelessWidget {
  const TextWidget2({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    print('$text widget calisti');
    return Text(text);
  }
}
