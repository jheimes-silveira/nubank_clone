import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

abstract class FindProductsDatasource {
  Future<List<ProductEntity>> call(String query);
}
