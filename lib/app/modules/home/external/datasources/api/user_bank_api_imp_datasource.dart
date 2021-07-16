import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/modules/home/data/datasources/user_bank_datasource.dart';
import 'package:nubank_clone/app/modules/home/domain/model/entities/user_bank_entity.dart';

part 'user_bank_api_imp_datasource.g.dart';

@Injectable()
class UserBankApiImpDatasource implements UserBankDatasource {
  static UserBankEntity userBankCache;
  final GraphQLClient _client;

  UserBankApiImpDatasource(this._client);

  @override
  Future<UserBankEntity> call() async {
    if (userBankCache != null) return userBankCache;

    final String query = r"""
        {
          viewer {
            id
            name
            balance
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

    userBankCache = UserBankEntity(
      id: results.data["viewer"]["id"],
      name: results.data["viewer"]["name"],
      balance: double.parse(results.data["viewer"]["balance"].toString()),
    );

    return userBankCache;
  }
}
