import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nubank_clone/app/modules/home/domain/usecases/user_bank_usecase.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/usecases/find_products_usecase.dart';

part 'dashboard_controller.g.dart';

@Injectable()
class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final FindProductsUsecase _findProductsUsecase;
  final UserBankUsecase _userBankUsecase;

  @observable
  List<ProductEntity> products;

  @observable
  String query = "";

  @observable
  double balance;

  @observable
  bool loading = false;

  @observable
  bool error = false;

  _DashboardControllerBase(
    this._findProductsUsecase,
    this._userBankUsecase,
  );

  @action
  updateBalance() async {
    final userBank = await _userBankUsecase();
    this.balance = userBank.balance;
  }

  @action
  fetchProducts() async {
    try {
      loading = true;
      products = await _findProductsUsecase(query);
      error = false;
    } catch (e) {
      error = true;
    } finally {
      loading = false;
    }
  }
}
