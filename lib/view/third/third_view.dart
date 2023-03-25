import 'dart:math';

import 'package:bloc_cubit_example/core/base/base_stateful_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:flutter/material.dart';

class ThirdView extends StatefulWidget {
  const ThirdView({super.key});

  @override
  State<ThirdView> createState() => _ThirdViewState();
}

class _ThirdViewState extends BaseStatefulView<ThirdView, ThirdViewModel> {
  _ThirdViewState() : super(viewModel: ThirdViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          const SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Goa',
                textScaleFactor: 1,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(padding: EdgeInsets.all(8), width: 100, child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
