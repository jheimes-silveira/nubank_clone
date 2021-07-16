import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/find_products_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/repositories/find_products_repository.dart';

part 'find_products_imp_repository.g.dart';

@Injectable()
class FindProductsImpRepository implements FindProductsRepository {
  final FindProductsDatasource _findProductsDatasource;

  FindProductsImpRepository(this._findProductsDatasource);

  @override
  Future<List<ProductEntity>> call(String query) async {
    return _findProductsDatasource(query);
  }
}
