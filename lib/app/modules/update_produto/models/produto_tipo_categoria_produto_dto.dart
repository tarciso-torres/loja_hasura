import 'dart:convert';
import 'package:loja_hasura/app/modules/add_produto/models/tipo_produto_categoria_dto.dart';

ProdutoTipoCategoriaProdutoDto produtoTipoCategoriaProdutoDtoFromJson(String str) => ProdutoTipoCategoriaProdutoDto.fromJson(json.decode(str));

String produtoTipoCategoriaProdutoDtoToJson(ProdutoTipoCategoriaProdutoDto data) => json.encode(data.toJson());



class ProdutoTipoCategoriaProdutoDto {
    List<TipoECategoriaDto> tipoProduto;
    List<TipoECategoriaDto> categoriaProduto;
    List<Produto> produto;

    ProdutoTipoCategoriaProdutoDto({
        this.tipoProduto,
        this.categoriaProduto,
        this.produto,
    });

    factory ProdutoTipoCategoriaProdutoDto.fromJson(Map<String, dynamic> json) => ProdutoTipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDto>.from(json["tipo_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        categoriaProduto: List<TipoECategoriaDto>.from(json["categoria_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        produto: List<Produto>.from(json["produto"].map((x) => Produto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toJson())),
        "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toJson())),
        "produto": List<dynamic>.from(produto.map((x) => x.toJson())),
    };
}

class Produto {
    String id;
    String nome;
    String tipoProdutoId;
    TipoECategoriaDto categoriaProduto;
    TipoECategoriaDto tipoProduto;

    Produto({
        this.id,
        this.nome,
        this.tipoProdutoId,
        this.categoriaProduto,
        this.tipoProduto,
    });

    factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        id: json["id"],
        nome: json["nome"],
        tipoProdutoId: json["tipo_produto_id"],
        categoriaProduto: TipoECategoriaDto.fromMap(json["categoria_produto"]),
        tipoProduto: TipoECategoriaDto.fromMap(json["tipo_produto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "tipo_produto_id": tipoProdutoId,
        "categoria_produto": categoriaProduto.toJson(),
        "tipo_produto": tipoProduto.toJson(),
    };
}
