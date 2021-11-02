import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/app_routing.dart';
import 'modules/home/home_store.dart';
import 'modules/shared/auth/auth_controller.dart';
import 'modules/shared/auth/auth_repository.dart';
import 'modules/shared/sembast/sambest.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthRepository(dio: i.get())),
    Bind((i) => AuthController()),
    Bind((i) => Dio()),
    Bind((i) => HomeStore()),
    Bind((i) => AppDatabase()),
  ];

  @override
  List<ModularRoute> get routes => AppRouting.routes;
}
