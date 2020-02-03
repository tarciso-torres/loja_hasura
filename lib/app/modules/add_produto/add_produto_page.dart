import 'package:flutter/material.dart';
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
            CustomComboboxWidget(
             items: [
               Model("01", "Roupas"),
               Model("02", "Alimentos"),
               Model("03", "Automotivos"),
               Model("04","Jogos")],
             onChange: (item) {
               print(item.descricao);
             },
             itemSelecionado: Model("01", "Roupas"),
            ),
            LabelWidget(
              title: "Tipo produto",
            ),
            CustomComboboxWidget(
             items: [
               Model("01", "Roupas"),
               Model("02", "Alimentos"),
               Model("03", "Automotivos"),
               Model("04","Jogos")],
             onChange: (item) {
               print(item.descricao);
             },
             itemSelecionado: Model("01", "Roupas"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: primaryColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
