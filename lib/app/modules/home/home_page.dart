import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_hasura/app/modules/home/home_controller.dart';
import 'package:loja_hasura/app/modules/home/home_module.dart';
import 'package:loja_hasura/app/modules/home/widgets/card_produto/card_produto_widget.dart';
import 'package:loja_hasura/app/modules/models/produto_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: homeController.listaProdutos.length,
            itemBuilder: (BuildContext context, int index){
              ProdutoModel produto = homeController.listaProdutos[index];
              return CardProdutoWidget(
                nomeProduto: produto.nome,
                 valor: "${produto.valor}",
                  categoriaProduto: produto.categoriaProduto.descricao,
                   tipoProduto: produto.tipoProduto.descricao,
                   );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/AddProduto");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),  
      ),
    );
  }
}
