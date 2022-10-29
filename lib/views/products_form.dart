import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_compras/components/format_real_br.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:provider/provider.dart';

class ProductsForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();
  
  final Map<String, String> _formData = {};

  void _loadFormData(Product product) {
    _formData['id'] = product.id as String;
    _formData['name'] = product.name!;
    _formData['price'] = product.price.toString();
    _formData['qty'] = product.qty.toString();
  }

  @override 
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments;
    final formatPrice = FormatRealBr();
   
    if(product != null) {
      _loadFormData(product as Product);
    }
    
    return Scaffold(
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
        actions: <Widget>[
          IconButton(
            onPressed: () { 
              if(_form.currentState!.validate()) {
                _form.currentState?.save();
                Provider.of<Products>(context, listen: false).products;
                Provider.of<Products>(context, listen: false).setProduct(
                  _formData['id'].toString(),
                  _formData['name'].toString(),
                  _formData['price']!.replaceAllMapped(RegExp(r'[^0-9/,]'), (match) => '').replaceAll(',', '.'),
                  int.parse(_formData['qty']!)
                );
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.save_alt)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Escreva o nome do produto';
                    }
                    return null;
                  },
                  initialValue: _formData['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                  decoration: const InputDecoration(
                    labelText: 'NOME',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 42,42,42),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 42,42,42)),
                    ),
                  ),
                  onSaved: ((newName) => {
                    _formData['name'] = newName!
                  }),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    formatPrice.coin,
                    LengthLimitingTextInputFormatter(15)
                  ],
                  initialValue: formatPrice.coin.format(_formData['price']??'0'),
                  validator: ((value) {
                    if(value == null || value.isEmpty || double.parse(value.replaceAll(RegExp(r'[^0-9]'), '')) <= 0) {
                      return 'Por favor, escreva um preço maior que zero';
                    } 
                    return null;
                  }),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                  decoration: const InputDecoration(
                    labelText: 'PREÇO',
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 42,42,42),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 42,42,42)),
                    ),
                  ),
                  onSaved: (newPrice) => {
                    _formData['price'] = newPrice!
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextFormField(
                  initialValue: _formData['qty']??'1',
                  validator: ((value) {
                    if(value == null || value.isEmpty || int.parse(value) <= 0) {
                      return 'Por favor, escreva uma quantidade maior que zero';
                    } 
                    return null;
                  }),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                  decoration: const InputDecoration(
                    labelText: 'QUANTIDADE',
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 42,42,42),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 42,42,42)),
                    ),
                  ),
                  onSaved: (newPrice) => {
                    _formData['qty'] = newPrice!
                  },
                ),
              ),
             
            ]
          ),
        ),
      )
    );
  }
}