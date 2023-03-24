import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/view/third/third_view_state.dart';

class ThirdViewModel extends BaseViewModel<ThirdState> {
  ThirdViewModel() : super(ThirdState(number: 0));
  @override
  void onReady() {
    super.onReady();
  }

  void increment() => emit(state.copyWith(number: state.number + 1));
  void decrement() => emit(state.copyWith(number: state.number - 1));
}
