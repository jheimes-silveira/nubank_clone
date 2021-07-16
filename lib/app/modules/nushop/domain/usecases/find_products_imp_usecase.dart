import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/domain/repositories/find_products_repository.dart';
import 'package:nubank_clone/app/modules/nushop/domain/usecases/find_products_usecase.dart';

part 'find_products_imp_usecase.g.dart';

@Injectable()
class FindProductsImpUsecase implements FindProductsUsecase {
  final FindProductsRepository _findProductsRepository;

  FindProductsImpUsecase(this._findProductsRepository);

  @override
  Future<List<ProductEntity>> call(String query) {
    return _findProductsRepository(query);
  }
}
