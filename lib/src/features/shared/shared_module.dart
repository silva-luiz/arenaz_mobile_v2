import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<Dio>(() {
      final dio = Dio();
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          logPrint: (object) {
            log(object.toString());
          },
        ),
      );
      return dio;
    });
  }
}
