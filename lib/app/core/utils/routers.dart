import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

class Routers {
  static goToNuShopDashboard() {
    return Modular.to.pushNamed("/nushop");
  }

  static goToNuShopProduct(ProductEntity product) {
    return Modular.to.pushNamed("/nushop/product", arguments: product);
  }
}
