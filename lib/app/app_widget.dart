import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_clone/app/core/network/nu_client.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: NuGraphQLClient.instanceValueNotifier(),
      child: MaterialApp(
        title: 'Nubank',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF830AD1),
          primaryColor: Color(0xFF9028D6),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF9028D6),
            ),
          ),
        ),
        initialRoute: "/home",
      ).modular(),
    );
  }
}
