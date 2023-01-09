import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_compras/components/format_real_br.dart';
import 'package:lista_compras/components/forms/input_custom.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:provider/provider.dart';

class ProductsForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();
  
  final Map<String, dynamic> _formData = {};

  void _loadFormData(Product product) {
    _formData['id'] = product.id as String;
    _formData['name'] = product.name!;
    _formData['price'] = product.price!.toStringAsFixed(2).toString();
    _formData['qty'] = product.qty.toString();
    _formData['listId'] = product.listId!;
  }

  @override 
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    final paramProduct = ModalRoute.of(context)?.settings.arguments;
    final formatPrice = FormatRealBr();
   
    if(paramProduct is Product) {
      _loadFormData(paramProduct as Product);
    }

    if(paramProduct is int) {
      _formData["listId"] = paramProduct;
    }
    
    return Scaffold(
      resizeToAvoidBottomInset : true,
      appBar: AppBar(
        title: const Text(
          'FORMULÁRIO DE PRODUTOS',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  InputCustom(
                    initValue: _formData['name'],
                    label: 'NOME',
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Escreva o nome do produto';
                      }
                      return null;
                    },
                    save: ((newName) => {
                      _formData['name'] = newName!
                    }), 
                  ),
                  InputCustom(
                    initValue: formatPrice.coin.format(_formData['price']??'0'),
                    label: 'PREÇO',
                    validator: (value) {
                      if(value == null || value.isEmpty || double.parse(value.replaceAll(RegExp(r'[^0-9]'), '')) < 0) {
                        return 'Por favor, escreva um preço maior que zero';
                      } 
                      return null;
                    },
                    save: (newPrice) => {
                      _formData['price'] = newPrice!
                    }, 
                    typeKeyboard: TextInputType.number,
                    maskInput: <TextInputFormatter>[
                      formatPrice.coin,
                      LengthLimitingTextInputFormatter(15)
                    ],
                  ),
                  InputCustom(
                    initValue: _formData['qty'],
                    label: 'QUANTIDADE',
                    validator: (value) {
                      if(value == null || value.isEmpty || int.parse(value) <= 0) {
                        return 'Por favor, escreva uma quantidade maior que zero';
                      } 
                      return null;
                    },
                    save: (newQty) => {
                      _formData['qty'] = newQty!
                    }, 
                    typeKeyboard: TextInputType.number
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
                          dataDb.setProduct(
                            _formData['id'].toString(),
                            _formData['name'].toString(),
                            double.parse(_formData['price']!.replaceAllMapped(RegExp(r'[^0-9/,]'), (match) => '').replaceAll(',', '.')),
                            int.parse(_formData['qty']!),
                            _formData['listId']
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('SALVAR'),
                    )
                  )
                ]
              )
            ]
          ),
        ),
      )
    );
  }
}