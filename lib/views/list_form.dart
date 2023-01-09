import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/components/forms/input_custom.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:provider/provider.dart';

class ListsForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {
    "id": "0"
  };

  void _loadFormData(ListBuy listBuy) {
    _formData['id'] = listBuy.id.toString();
    _formData['name'] = listBuy.name!;
  }
  
  @override 
  Widget build(BuildContext context) {
    final GetData list = Provider.of(context);
    final listBuy = ModalRoute.of(context)?.settings.arguments;

    if(listBuy != null && listBuy is ListBuy) {
      _loadFormData(listBuy);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FORMULÁRIO DE LISTA',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              InputCustom(
                initValue: _formData['name'],
                label: 'NOME',
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Escreva o nome da lista';
                  }
                  return null;
                },
                save: ((newName) => {
                  _formData['name'] = newName!
                }), 
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(left: 15.0, right: 5.0, top: 5.0, bottom: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                    primary: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    if(_form.currentState!.validate()) {
                      _form.currentState?.save();
                      list.setList(
                        int.parse(_formData['id']!),
                        _formData['name']!
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('SALVAR'),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}