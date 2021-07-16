import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/home/domain/repositories/user_bank_repository.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/usecases/purchase_product_usecase.dart';

import '../repositories/update_balance_repository.dart';

part 'purchase_product_imp_usecase.g.dart';

@Injectable()
class PurchaseProductImpUsecase implements PurchaseProductUsecase {
  final UserBankRepository _userBankRepository;
  final UpdateBalanceRepository _updateBalanceRepository;

  PurchaseProductImpUsecase(
    this._userBankRepository,
    this._updateBalanceRepository,
  );

  @override
  Future<void> call(ProductEntity product) async {
    final userBank = await _userBankRepository();

    if (userBank.balance < product.price) throw Exception("Saldo insuficiente");

    // _purchaseProductRepository(product); TODO cenario onde o back valida a compra

    _updateBalanceRepository(userBank.balance - product.price);
  }
}
