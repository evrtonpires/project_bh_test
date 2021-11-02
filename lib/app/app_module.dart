import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/shared/auth/auth_controller.dart';
import 'modules/shared/auth/auth_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<AuthRepository>((i) => AuthRepository(dio: i.get())),
    Bind((i) => AuthController()),
    Bind((i) => Dio()),
    Bind((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
