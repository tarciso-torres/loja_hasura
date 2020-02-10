import 'package:loja_hasura/app/modules/add_produto/models/tipo_produto_categoria_dto.dart';
import 'package:loja_hasura/app/modules/update_produto/repositories/update_produto_repository.dart';
import 'package:mobx/mobx.dart';

import 'models/produto_tipo_categoria_produto_dto.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;
  final String produtoId;

  _UpdateProdutoBase(this.updateProdutoRepository, this.produtoId){
    updateProdutoRepository.getProdutoTipoCategoriaProduto(produtoId).then((data) {
      tipoProduto = data;
    });
  }

@observable
  String descricao = "";

  @action
  setDescricao(String _desc) {
    descricao = _desc;
  }

  @observable
  String valor = "";

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }


  @observable
  ProdutoTipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> editar() async{
    if(descricao != null && valor != null && selectedTipo?.id != null && selectedCategoria?.id != null)
    {
      return await updateProdutoRepository.updateProduto(
        produtoId: produtoId,
        descricao: descricao,
        valor: valor,
        selectedProduto: selectedTipo.id,
        selectedCategoria: selectedCategoria.id);
    }
    return false;
  }
}
