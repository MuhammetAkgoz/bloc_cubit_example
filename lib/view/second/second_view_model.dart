import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';

class SecondViewModel extends BaseViewModel<SecondState> {
  SecondViewModel() : super(SecondState(args: ''));

  @override
  void onInit() {
    super.onInit();

    Map<String, String> _arg = arg as Map<String, String>;
    emit(state.copyWith(args: _arg['a'] ?? ''));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
