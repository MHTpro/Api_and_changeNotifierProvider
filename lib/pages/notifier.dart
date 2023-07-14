import 'package:flutter/widgets.dart';
import 'package:test_project/api/my_api.dart';
import 'package:test_project/model/model.dart';

class MyNotifier extends ChangeNotifier {
  bool loading = false;
  List<MainModel>? lastResponse;

  Future<void> getResponse() async {
    loading = true;
    notifyListeners();

    final response = await getAllDatas();
    lastResponse = response;

    loading = false;
    notifyListeners();
  }
}
