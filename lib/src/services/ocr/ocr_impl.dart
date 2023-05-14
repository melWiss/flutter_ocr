import 'dart:io';

import 'package:flutter_ocr/src/services/ocr/ocr_interface.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOcr, env: [Environment.dev])
class OCR implements IOcr {
  @override
  Future<String> analyzeFile(File file) async {
    InputImage image = InputImage.fromFile(file);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);
    await textRecognizer.close();
    return recognizedText.text;
  }
}
