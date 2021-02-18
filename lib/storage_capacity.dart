import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StorageCapacity {
  static const MethodChannel _channel = const MethodChannel('storage_capacity');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get getFreeSpace async {
    var result = await _channel.invokeMethod('getFreeSpace');
    return result.toString();
  }

  static Future<String> get getOccupiedSpace async {
    var result = await _channel.invokeMethod('getOccupiedSpace');
    return result.toString();
  }

  static Future<String> get getTotalSpace async {
    var result = await _channel.invokeMethod('getTotalSpace');
    return result.toString();
  }

  static String toMegaBytes(value) {
    return (double.parse(value) / 1000000).toStringAsFixed(2);
  }

  static String toGigaBytes(double value) {
    return (value / 1000000000).toStringAsFixed(2);
  }

  static List<double> _capacities = [16, 32, 64, 128, 256, 512, 1024];

  static String searchCapacity(double totalCapacity) {
    var i = _capacities.length ~/ 2;
    var count = 0;
    for (count = 0; count < _capacities.length; count++) {
      var difference = totalCapacity - _capacities[count];
      var difference = totalCapacity - _capacities[i];
      if ((difference <= 0)) {
        i = i - 1;
        break;
      }
    }
    return _capacities[i].toString();
    return _capacities[count].toString();
  }
}
