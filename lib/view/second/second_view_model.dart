import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/first/first_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondViewModel extends BaseViewModel<SecondState> {
  SecondViewModel() : super(SecondState(args: ''));

  @override
  void onReady() {
    super.onReady();

    /// Pick args on tree
    final args = BlocProvider.of<FirstViewModel>(context).state.name;
    emit(state.copyWith(args: args));
  }

  void changeTheme() => BlocProvider.of<ThemeProvider>(context).change();
}
