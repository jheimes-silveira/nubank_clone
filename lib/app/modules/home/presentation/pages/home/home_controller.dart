import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nubank_clone/app/modules/home/domain/usecases/user_bank_usecase.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserBankUsecase _userBankUsecase;

  @observable
  bool showInfos = true;

  @observable
  double balance = 0;

  @observable
  String name;

  @observable
  bool loading = false;

  @observable
  bool error = false;

  _HomeControllerBase(this._userBankUsecase);

  @action
  updateBalance() async {
    final userBank = await _userBankUsecase();
    this.balance = userBank.balance;
  }

  @action
  fetchUserBank() async {
    try {
      loading = true;
      final userBanck = await _userBankUsecase();

      balance = userBanck.balance;
      name = userBanck.name;
      error = false;
    } catch (e) {
      error = true;
    } finally {
      loading = false;
    }
  }

  @action
  setShowInfos() => showInfos = !showInfos;
}
