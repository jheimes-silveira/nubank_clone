import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/home/home_module.dart';
import 'package:nubank_clone/app/modules/nushop/nushop_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/nushop', module: NushopModule()),
  ];
}
