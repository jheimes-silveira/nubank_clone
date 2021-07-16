import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NuGraphQLClient {
  static GraphQLClient _client;
  static ValueNotifier<GraphQLClient> _valueNotifier;

  static instanceGraphQLClient() {
    if (_client == null) {
      _client = instanceValueNotifier().value;
    }

    return _client;
  }

  static instanceValueNotifier() {
    if (_valueNotifier == null) {
      _valueNotifier = ValueNotifier(
        GraphQLClient(
          link: _link(),
          cache: GraphQLCache(store: HiveStore()),
        ),
      );
    }

    return _valueNotifier;
  }

  static Link _link() {
    final headers = {
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c'
    };

    return HttpLink(
      'https://staging-nu-needful-things.nubank.com.br/query',
      defaultHeaders: headers,
    );
  }
}
