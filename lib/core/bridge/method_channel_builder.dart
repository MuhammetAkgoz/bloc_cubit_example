import 'package:flutter/services.dart';

class MethodChannelBuilder {
  late final MethodChannel channel;

  MethodChannelBuilder createChannel(String channelType) {
    channel = MethodChannel('com.neohub.$channelType');
    return this;
  }
}
