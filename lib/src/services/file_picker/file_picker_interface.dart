import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class IFilePicker {
  Future<File> pickImage(ImageSource source);
  File get lastFile;
  bool get hasLast;
}
