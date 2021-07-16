import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/app_module.dart';

import 'app/app_widget.dart';

void main() async {
   //métodos para configurar o client graphql
  await initHiveForFlutter();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
