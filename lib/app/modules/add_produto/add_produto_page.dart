import 'package:flutter/material.dart';
import 'package:loja_hasura/app/shared/widgets/label/label_widget.dart';
import 'package:loja_hasura/app/shared/widgets/textField/textField_widget.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"}) : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LabelWidget(
              title: "Descrição",
            ),
            TextFieldWidget(
              hintText: "Descrição do Produto",
            ),
            SizedBox(
              height: 20,
            ),
            LabelWidget(
              title: "Valor",
            ),
            TextFieldWidget(
              hintText: "Valor",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            LabelWidget(
              title: "Categoria do Produto",
            ),
            TextFieldWidget(
              hintText: "Categoria produto",
            ),
            LabelWidget(
              title: "Tipo produto",
            )
          ],
        ),
      )
    );
  }
}
