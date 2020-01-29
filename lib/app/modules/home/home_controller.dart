import 'package:loja_hasura/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  final HomeRepository _repository;
  _HomeBase(this._repository){
    listaProdutos = _repository.getProduto();
  }

  @observable
  List<String> listaProdutos = [];

}
