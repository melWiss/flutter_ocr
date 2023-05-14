import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_ocr/src/screens/home/home_events.dart';
import 'package:flutter_ocr/src/services/file_picker/file_picker_interface.dart';
import 'package:flutter_ocr/src/services/ocr/ocr_interface.dart';
import 'package:image_picker/image_picker.dart';

class HomeBloc extends ValueNotifier<HomeState> {
  final IFilePicker filePicker;
  final IOcr ocr;

  File? _currentFile;
  File? get file => _currentFile;

  String? _analyzedString;
  String get text => _analyzedString ?? "";

  HomeBloc(super._value, {required this.filePicker, required this.ocr});

  Future<void> pickImageFromGallery() async {
    value = Loading();
    notifyListeners();
    try {
      _currentFile = await filePicker.pickImage(ImageSource.gallery);
      value = AddedImageFromGallery();
    } catch (e) {
      value = Error();
    }
    notifyListeners();
  }

  Future<void> pickImageFromCamera() async {
    value = Loading();
    notifyListeners();
    try {
      _currentFile = await filePicker.pickImage(ImageSource.camera);
      value = AddedImageFromCamera();
    } catch (e) {
      value = Error();
    }
    notifyListeners();
  }

  Future<void> analyzeReceipt() async {
    if (_currentFile != null) {
      value = Loading();
      notifyListeners();
      try {
        _analyzedString = await ocr.analyzeFile(_currentFile!);
        value = AnalyzedImage();
      } catch (e) {
        value = Error();
      }
      notifyListeners();
    }
  }

  void reset() {
    value = Initial();
    notifyListeners();
  }
}
