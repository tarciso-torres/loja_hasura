import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_hasura/app/modules/home/home_controller.dart';
import 'package:loja_hasura/app/modules/home/home_module.dart';
import 'package:loja_hasura/app/modules/home/widgets/card_produto/card_produto_widget.dart';
import 'package:mobx/mobx.dart';

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
              return CardProdutoWidget(
                nomeProduto: "Produto $index",
                 valor: "${10*index}",
                  categoriaProduto: "Categoria $index",
                   tipoProduto: "Tipo $index",
                   );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),  
      ),
    );
  }
}
