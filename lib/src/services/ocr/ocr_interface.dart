import 'dart:io';

abstract class IOcr {
  Future<String> analyzeFile(File file);
}