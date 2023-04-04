import 'package:bloc_cubit_example/core/bridge/method_channel_builder.dart';
import 'package:bloc_cubit_example/core/util/logger.dart';
import 'package:flutter/services.dart';

abstract class IMethodChannel {
  final MethodChannelBuilder builder;
  IMethodChannel(this.builder);

  Future<T?> init<T>({Map<String, dynamic>? data}) async {
    try {
      final result = await builder.channel.invokeMethod('init', data) as T;
      return result;
    } on PlatformException catch (e) {
      NeoLogger.e('ERROR $e');
    }
    return null;
  }
}
