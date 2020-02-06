import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/modules/add_produto/models/tipo_produto_categoria_dto.dart';

class AddProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  AddProdutoRepository(this._hasuraConnect);

  Future<TipoCategoriaProdutoDto> getTipoCategoriaProduto() async{
    var query = '''
      query getTipoCategoriaProduto {
        tipo_produto {
          id
          descricao
        }
        categoria_produto {
          id
          descricao
        }
      }
    ''';

      var snapshot = await _hasuraConnect.query(query);

      return TipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }

    Future<TipoCategoriaProdutoDto> addProduto(String descriacao, String valor,
        String selectedProduto, String selectedCategoria) async{
    var query = '''
      query getTipoCategoriaProduto {
        tipo_produto {
          id
          descricao
        }
        categoria_produto {
          id
          descricao
        }
      }
    ''';

      var snapshot = await _hasuraConnect.query(query);

      return TipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
