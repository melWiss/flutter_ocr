import 'dart:io';

import 'package:flutter_ocr/src/services/file_picker/file_picker_exceptions.dart';
import 'package:flutter_ocr/src/services/file_picker/file_picker_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFilePicker, env: [Environment.dev])
class FilePicker implements IFilePicker {
  final ImagePicker _picker = ImagePicker();
  File? _last;
  @override
  Future<File> pickImage(ImageSource source) async {
    var xfile = await _picker.pickImage(source: source);
    if(xfile != null) {
      return _last = File(xfile.path);
    }
    throw NoFilePicked();
  }

  @override
  File get lastFile => _last!;

  @override
  bool get hasLast => _last != null;
}
