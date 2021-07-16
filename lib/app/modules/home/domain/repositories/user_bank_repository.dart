import 'package:nubank_clone/app/modules/home/domain/model/entities/user_bank_entity.dart';

abstract class UserBankRepository {
  Future<UserBankEntity> call();
}
