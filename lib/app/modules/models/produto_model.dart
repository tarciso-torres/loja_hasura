// To parse this JSON data, do
//
//     final produtoModel = produtoModelFromJson(jsonString);

import 'dart:convert';

ProdutoModel produtoModelFromJson(String str) => ProdutoModel.fromJson(json.decode(str));

String produtoModelToJson(ProdutoModel data) => json.encode(data.toJson());

class ProdutoModel {
    String id;
    String nome;
    int valor;
    AtributoGenerico tipoProduto;
    AtributoGenerico categoriaProduto;

    ProdutoModel({
        this.id,
        this.nome,
        this.valor,
        this.tipoProduto,
        this.categoriaProduto,
    });

    factory ProdutoModel.fromJson(Map<String, dynamic> json) => ProdutoModel(
        id: json["id"],
        nome: json["nome"],
        valor: json["valor"],
        tipoProduto: AtributoGenerico.fromJson(json["tipo_produto"]),
        categoriaProduto: AtributoGenerico.fromJson(json["categoria_produto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "valor": valor,
        "tipo_produto": tipoProduto.toJson(),
        "categoria_produto": categoriaProduto.toJson(),
    };

    static List<ProdutoModel> fromJsonList(List list) {
      if(list == null) return null;
      return list
              .map<ProdutoModel>((item) => ProdutoModel.fromJson(item))
              .toList();
    }
}

class AtributoGenerico {
    String descricao;

    AtributoGenerico({
        this.descricao,
    });

    factory AtributoGenerico.fromJson(Map<String, dynamic> json) => AtributoGenerico(
        descricao: json["descricao"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao,
    };
}