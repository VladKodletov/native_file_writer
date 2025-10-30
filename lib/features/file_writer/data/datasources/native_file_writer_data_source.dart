import 'dart:async';
import 'package:flutter/services.dart';

abstract class NativeFileWriterDataSource {
  Future<String> writeToFileNative(int counter);
}

class NativeFileWriterDataSourceImpl implements NativeFileWriterDataSource {
  static const MethodChannel _channel = MethodChannel('native_file_writer');
  
  @override
  Future<String> writeToFileNative(int counter) async {
    try {
      final String result = await _channel.invokeMethod(
        'writeToFile',
        {'counter': counter},
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception('Failed to write to file: ${e.message}');
    }
  }
}