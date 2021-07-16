import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/modules/nushop/data/datasources/find_products_datasource.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

part 'find_products_api_imp_datasource.g.dart';

@Injectable()
class FindProductsApiImpDatasource implements FindProductsDatasource {
  final GraphQLClient _client;

  FindProductsApiImpDatasource(this._client);

  @override
  Future<List<ProductEntity>> call(String query) async {
    final String query = r"""
        {
          viewer {
            offers {
              id
              price 
              product {
                  id 
                  name
                  description
                  image
                }
            }
          }
        }
    """;

    final results = await _client.query(
      QueryOptions(
        document: gql(query),
      ),
    );

    if (results.hasException) {
      throw results.exception;
    }
    return (results.data["viewer"]["offers"] as List)
        .map(
          (e) => ProductEntity(
            id: e["product"]["id"],
            title: e["product"]["name"],
            description: e["product"]["description"],
            image: e["product"]["image"],
               price: double.parse(e["price"].toString()),
          ),
        )
        .toList();
  }
}
