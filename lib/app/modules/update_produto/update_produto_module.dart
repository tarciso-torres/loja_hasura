import 'package:flutter/cupertino.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/app_module.dart';
import 'package:loja_hasura/app/modules/update_produto/repositories/update_produto_repository.dart';
import 'package:loja_hasura/app/modules/update_produto/update_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_hasura/app/modules/update_produto/update_produto_page.dart';

class UpdateProdutoModule extends ChildModule {
  final String produtoId;

  UpdateProdutoModule({@required this.produtoId});

  @override
  List<Bind> get binds => [
        Bind((i) => UpdateProdutoRepository(AppModule.to.get<HasuraConnect>())),
        Bind((i) => UpdateProdutoController(i.get<UpdateProdutoRepository>(), produtoId)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UpdateProdutoPage()),
      ];

  static Inject get to => Inject<UpdateProdutoModule>.of();
}
