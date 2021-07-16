import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/update_balance_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/domain/repositories/update_balance_repository.dart';

part 'update_balance_imp_repository.g.dart';

@Injectable()
class UpdateBalanceImpRepository implements UpdateBalanceRepository {
  final UpdateBalanceDatasource _updateBalanceDatasource;

  UpdateBalanceImpRepository(this._updateBalanceDatasource);

  @override
  Future<void> call(double balance) {
    return _updateBalanceDatasource(balance);
  }
}
