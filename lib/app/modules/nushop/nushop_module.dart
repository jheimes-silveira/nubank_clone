import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/core/network/nu_client.dart';
import 'package:nubank_clone/app/modules/home/data/repositories/user_bank_imp_repository.dart';
import 'package:nubank_clone/app/modules/home/external/datasources/api/user_bank_api_imp_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/product/product_controller.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/product/product_page.dart';

import 'data/repositories/find_products_imp_repository.dart';
import 'data/repositories/purchase_product_imp_repository.dart';
import 'data/repositories/update_balance_imp_repository.dart';
import 'domain/usecases/find_products_imp_usecase.dart';
import 'domain/usecases/purchase_product_imp_usecase.dart';
import 'external/datasources/api/find_products_api_imp_datasource.dart';
import 'external/datasources/api/purchase_product_api_imp_datasource.dart';
import 'external/datasources/api/update_balance_api_imp_datasource.dart';
import 'presentation/pages/dashboard/dashboard_page.dart';

class NushopModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<GraphQLClient>((i) => NuGraphQLClient.instanceGraphQLClient()),
    $UserBankApiImpDatasource,
    $UserBankImpRepository,
    $FindProductsApiImpDatasource,
    $FindProductsImpRepository,
    $FindProductsImpUsecase,
    $PurchaseProductApiImpDatasource,
    $PurchaseProductImpRepository,
    $PurchaseProductImpUsecase,
    $UpdateBalanceApiImpDatasource,
    $UpdateBalanceImpRepository,
    $DashboardController,
    $ProductController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => DashboardPage(),
    ),
    ChildRoute(
      '/product',
      child: (_, args) => ProductPage(args.data),
    ),
  ];
}
