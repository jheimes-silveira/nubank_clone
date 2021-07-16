import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/core/network/nu_client.dart';
import 'package:nubank_clone/app/modules/home/data/repositories/user_bank_imp_repository.dart';
import 'package:nubank_clone/app/modules/home/domain/usecases/user_bank_imp_usecase.dart';
import 'package:nubank_clone/app/modules/home/external/datasources/api/user_bank_api_imp_datasource.dart';
import 'package:nubank_clone/app/modules/home/presentation/pages/home/home_controller.dart';
import 'package:nubank_clone/app/modules/home/presentation/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<GraphQLClient>((i) => NuGraphQLClient.instanceGraphQLClient()),
    $UserBankApiImpDatasource,
    $UserBankImpRepository,
    $UserBankImpUsecase,
    $HomeController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(),
    ),
  ];
}
