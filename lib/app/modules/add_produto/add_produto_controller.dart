import 'package:loja_hasura/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:mobx/mobx.dart';
import 'models/tipo_produto_categoria_dto.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoBase with _$AddProdutoController;

abstract class _AddProdutoBase with Store {

  final AddProdutoRepository addProdutoRepository;
  @observable
  int value = 0;

  _AddProdutoBase(this.addProdutoRepository){
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  void increment() {
    value++;
  }
}
