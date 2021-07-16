import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/purchase_product_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/repositories/purchase_product_repository.dart';

part 'purchase_product_imp_repository.g.dart';

@Injectable()
class PurchaseProductImpRepository implements PurchaseProductRepository {
  final PurchaseProductDatasource _purchaseProductDatasource;

  PurchaseProductImpRepository(this._purchaseProductDatasource);
  
  @override
  Future call(ProductEntity product) {
    return _purchaseProductDatasource(product);
  }
}
