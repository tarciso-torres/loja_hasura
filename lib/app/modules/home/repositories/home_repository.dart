import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class HomeRepository extends Disposable {
  List<String> getProduto() {
    return ["1", "2", "3", "4", "5", "6"];
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
