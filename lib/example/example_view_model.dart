import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleViewModel extends Cubit<ExampleState> {
  ExampleViewModel() : super(ExampleState(number: 5));

  void increase() {
    int result = state.number + 1;
    emit(state.copyWith(number: result));
  }

  void decrease() {
    int result = state.number - 1;
    emit(state.copyWith(number: result));
  }
}

class ExampleState extends Equatable {
  final int number;

  ExampleState({required this.number});

  @override
  List<Object?> get props => [number];

  ExampleState copyWith({
    int? number,
  }) {
    return ExampleState(
      number: number ?? this.number,
    );
  }
}
