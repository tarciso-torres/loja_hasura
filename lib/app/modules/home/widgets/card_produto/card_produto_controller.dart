import 'package:mobx/mobx.dart';

part 'card_produto_controller.g.dart';

class CardProdutoController = _CardProdutoBase with _$CardProdutoController;

abstract class _CardProdutoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
