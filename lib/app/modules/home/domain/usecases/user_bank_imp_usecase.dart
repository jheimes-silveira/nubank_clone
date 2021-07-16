import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/home/domain/model/entities/user_bank_entity.dart';
import 'package:nubank_clone/app/modules/home/domain/repositories/user_bank_repository.dart';
import 'package:nubank_clone/app/modules/home/domain/usecases/user_bank_usecase.dart';

part 'user_bank_imp_usecase.g.dart';

@Injectable()
class UserBankImpUsecase implements UserBankUsecase {
  final UserBankRepository _userBankRepository;

  UserBankImpUsecase(this._userBankRepository);

  @override
  Future<UserBankEntity> call() {
    return _userBankRepository();
  }
}
