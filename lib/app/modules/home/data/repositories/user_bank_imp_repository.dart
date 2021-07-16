import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/home/data/datasources/user_bank_datasource.dart';
import 'package:nubank_clone/app/modules/home/domain/model/entities/user_bank_entity.dart';
import 'package:nubank_clone/app/modules/home/domain/repositories/user_bank_repository.dart';

part 'user_bank_imp_repository.g.dart';

@Injectable()
class UserBankImpRepository implements UserBankRepository {
  final UserBankDatasource _userBankDatasource;

  UserBankImpRepository(this._userBankDatasource);

  @override
  Future<UserBankEntity> call() {
    return _userBankDatasource();
  }
}
