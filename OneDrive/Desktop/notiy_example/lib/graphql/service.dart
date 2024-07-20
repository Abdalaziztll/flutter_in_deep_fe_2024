import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:notiy_example/graphql/config.dart';
import 'package:notiy_example/graphql/gql.dart';

Future<dynamic> getData() async {
  var req = await getGraph();

  var result =await req.query(
    QueryOptions(
      document: gql(
        userGql,
      ),
    ),
  );

  return result;
}
