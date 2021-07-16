import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

abstract class FindProductsRepository {
  Future<List<ProductEntity>> call(String query);
}
