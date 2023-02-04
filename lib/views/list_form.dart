import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/components/appbar_custom.dart';
import 'package:lista_compras/components/forms/form_custom.dart';
import 'package:lista_compras/components/forms/input_custom.dart';
import 'package:lista_compras/components/forms/submit.dart';
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
      appBar: AppBarCustom(
        titleCustom: 'FORMULÁRIO DE LISTA',
      ),
      body: FormCustom(
        key: _form,
        inputs: <Widget>[
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
          Submit(
            title: 'SALVAR', 
            action: () {
              if(_form.currentState!.validate()) {
                _form.currentState?.save();
                list.setList(
                  int.parse(_formData['id']!),
                  _formData['name']!
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      )
    );
  }
}