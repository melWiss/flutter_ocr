// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_ocr/src/services/file_picker/file_picker_impl.dart'
    as _i4;
import 'package:flutter_ocr/src/services/file_picker/file_picker_interface.dart'
    as _i3;
import 'package:flutter_ocr/src/services/ocr/ocr_impl.dart' as _i6;
import 'package:flutter_ocr/src/services/ocr/ocr_interface.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IFilePicker>(
      () => _i4.FilePicker(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i5.IOcr>(
      () => _i6.OCR(),
      registerFor: {_dev},
    );
    return this;
  }
}
