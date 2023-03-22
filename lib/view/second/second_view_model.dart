import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondViewModel extends BaseViewModel<SecondState> {
  SecondViewModel() : super(SecondState(args: ''));

  @override
  void onInit() {
    super.onInit();

    /// Pick args on tree
    final args = BlocProvider.of<FirstViewModel>(context).state.name;
    emit(state.copyWith(args: args));
  }
}
