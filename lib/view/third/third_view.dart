import 'package:odin/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:flutter/material.dart';

class ThirdView extends StatefulWidget {
  const ThirdView({super.key});

  @override
  State<ThirdView> createState() => _ThirdState();
}

class _ThirdState extends BaseStatefulView<ThirdView, ThirdViewModel> {
  _ThirdState() : super(viewModel: ThirdViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
