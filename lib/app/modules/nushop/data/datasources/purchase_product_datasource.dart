import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

abstract class PurchaseProductDatasource {
  Future<void> call(ProductEntity product);
}
