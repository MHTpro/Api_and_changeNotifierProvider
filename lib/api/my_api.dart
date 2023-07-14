import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:test_project/model/model.dart';

Future<List<MainModel>> getAllDatas() async {
  final response = await https.get(
    Uri.https(
      "jsonplaceholder.typicode.com",
      "/posts",
    ),
  );

  if (response.statusCode == 200) {
    return List<MainModel>.from(
      jsonDecode(response.body).map(
        (v) => MainModel.fromJson(v),
      ),
    );
  } else {
    throw Exception("Error:Can't load data");
  }
}
