import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/modules/update_produto/models/produto_tipo_categoria_produto_dto.dart';

class UpdateProdutoRepository extends Disposable {

  final HasuraConnect _hasuraConnect;

  UpdateProdutoRepository(this._hasuraConnect);

  Future<ProdutoTipoCategoriaProdutoDto> getProdutoTipoCategoriaProduto(String produtoId) async{
    var query = '''
      query getProdutoTipoCategoriaProduto($produtoId: uuid) {
        tipo_produto {
          id
          descricao
        }
        categoria_produto {
          id
          descricao
        }
        produto(where: {id: {_eq: $produtoId}}) {
          id
          nome
          tipo_produto_id
          categoria_produto {
            id
            descricao
          }
          tipo_produto {
            id
            descricao
          }
        }
      }
    ''';

      var snapshot = await _hasuraConnect.query(query, variables: {
        "produtoId": produtoId
      });

      return ProdutoTipoCategoriaProdutoDto.fromJson(snapshot["data"]);
  }

    Future<bool> updateProduto({String produtoId, String descricao, String valor,
        String selectedProduto, String selectedCategoria}) async{
    var mutation = '''
      mutation updateProduto(\$produtoID: uuid, \$nome: String, \$categoria: uuid, \$tipo: uuid, \$valor: float8) {
        update_produto(where: {id: {_eq: \$produtoID}}, _set: {nome: \$nome, tipo_produto_id: \$tipo, valor: \$valor, categoria_produto_id: \$categoria}) {
          affected_rows
        }
      }
    ''';

      var snapshot = await _hasuraConnect.mutation(mutation, variables: 
        {
          "nome": descricao,
          "categoria": selectedProduto,
          "tipo": selectedCategoria,
          "valor": valor,
          "produtoId": produtoId
        });

      return snapshot["data"]["update_produto"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
