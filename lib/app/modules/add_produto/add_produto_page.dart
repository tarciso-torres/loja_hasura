import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_controller.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_module.dart';
import 'package:loja_hasura/app/modules/add_produto/models/tipo_produto_categoria_dto.dart';
import 'package:loja_hasura/app/shared/widgets/custom_combobox/custom_combobox_widget.dart';
import 'package:loja_hasura/app/shared/widgets/label/label_widget.dart';
import 'package:loja_hasura/app/shared/widgets/textField/textField_widget.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"}) : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  AddProdutoController controller = AddProdutoModule.to.get();
  
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: mediaQueryHeight - 250,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4)
            ),
          ),
          Positioned(
            top: mediaQueryHeight - 200,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4)
            ),
          ),
          Positioned(
            top: mediaQueryHeight - 150,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4)
            ),
          ),
          Container(
            height: mediaQueryHeight,
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LabelWidget(
                      title: "Descrição",
                    ),
                    TextFieldWidget(
                      controller: controller.setDescricao,
                      hintText: "Descrição do Produto",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LabelWidget(
                      title: "Valor",
                    ),
                    TextFieldWidget(
                      controller: controller.setValor,
                      hintText: "Valor",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LabelWidget(
                      title: "Categoria do Produto",
                    ),
                    Observer(
                      builder: (BuildContext context){
                        if(controller.tipoProduto == null){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),   
                              ] 
                            )
                          );
                        }
                        return CustomComboboxWidget(
                        items: controller.tipoProduto.categoriaProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => controller.setSelectedTipo(
                          TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                        itemSelecionado: null,
                        );
                      },
                    ),
                    LabelWidget(
                      title: "Tipo produto",
                    ),
                    Observer(
                      builder: (BuildContext context){
                        if(controller.tipoProduto == null){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ] 
                            )
                          );
                        }
                        return CustomComboboxWidget(
                        items: controller.tipoProduto.tipoProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => controller.setSelectedCategoria(
                          TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                        itemSelecionado: null,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: primaryColor,
                        onPressed: () {
                          controller.salvar();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          )
        ],
      )
    );
  }
}
