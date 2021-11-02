import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';

class AppRouting {
  static final List<ModularRoute> routes = [
    ModuleRoute(AppRouteNamed.app._path!, module: HomeModule()),
  ];
}

enum AppRouteNamed { app }

extension AppouteNamedExtension on AppRouteNamed {
  String? get _path {
    switch (this) {
      case AppRouteNamed.app:
        return '/';
      default:
        return null;
    }
  }

  String? get fullPath => _path;
}
