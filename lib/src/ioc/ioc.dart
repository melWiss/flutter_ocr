import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ocr/src/ioc/ioc.config.dart';

final ioc = GetIt.instance;

@InjectableInit(initializerName: 'init')
void configureDependencies() => ioc.init(environment: Environment.dev);