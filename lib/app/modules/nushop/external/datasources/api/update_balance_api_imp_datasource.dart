import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/home/external/datasources/api/user_bank_api_imp_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/update_balance_datasource.dart';

part 'update_balance_api_imp_datasource.g.dart';

@Injectable()
class UpdateBalanceApiImpDatasource implements UpdateBalanceDatasource {
  // Regra de negocio deveria estar no back, mas para fins de teste esta local numa instancia corrente

  Future<void> call(double balance) async {
    if (UserBankApiImpDatasource.userBankCache == null)
      throw Exception("Erro ao carregar usuario logado");

    UserBankApiImpDatasource.userBankCache.balance = balance;
  }
}
