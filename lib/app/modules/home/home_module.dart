import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/app_module.dart';
import 'package:loja_hasura/app/modules/home/repositories/home_repository.dart';
import 'package:loja_hasura/app/modules/home/widgets/card_produto/card_produto_controller.dart';
import 'package:loja_hasura/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_hasura/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        
        // Controllers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        // Repositories
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
        // Outros
        
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
