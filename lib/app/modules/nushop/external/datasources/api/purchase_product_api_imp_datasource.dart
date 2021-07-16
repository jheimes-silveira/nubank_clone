import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/purchase_product_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

part 'purchase_product_api_imp_datasource.g.dart';

@Injectable()
class PurchaseProductApiImpDatasource implements PurchaseProductDatasource {
  @override
  Future call(ProductEntity product) {
    throw UnimplementedError();
  }
}
