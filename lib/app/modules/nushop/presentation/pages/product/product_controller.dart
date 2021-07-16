import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/usecases/purchase_product_usecase.dart';

part 'product_controller.g.dart';

@Injectable()
class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final PurchaseProductUsecase _purchaseProductUsecase;

  _ProductControllerBase(this._purchaseProductUsecase);

  @action
  purchase(ProductEntity product) async {
    try {
      await _purchaseProductUsecase(product);
      return null;
    } catch (e) {
      return e;
    }
  }
}
