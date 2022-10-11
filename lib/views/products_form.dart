import 'package:flutter/material.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:provider/provider.dart';

class ProductsForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();
  
  final Map<String, String> _formData = {};

  void _loadFormData(Product product) {
    _formData['id'] = product.id as String;
    _formData['name'] = product.name!;
    _formData['price'] = product.price!;
    if(product.photoUrl != null) {
      _formData['photoUrl'] = product.photoUrl!;
    }
  }

  @override 
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments;
   
    if(product != null) {
      _loadFormData(product as Product);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produtos'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () { 
              _form.currentState?.save();
              Provider.of<Products>(context, listen: false).products;
              Provider.of<Products>(context, listen: false).setProduct(
                _formData['id'].toString(),
                _formData['name'].toString(),
                _formData['price'].toString(),
                _formData['photoUrl'].toString()  
              );
              Navigator.of(context).pop();
            }, 
            icon: Icon(Icons.save_alt)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                onSaved: ((newName) => {
                  _formData['name'] = newName!
                }),
              ),
              TextFormField(
                initialValue: _formData['price'],
                decoration: InputDecoration(
                  labelText: 'Preço'
                ),
                onSaved: (newPrice) => {
                  _formData['price'] = newPrice!
                },
              ),
              TextFormField(
                initialValue: _formData['photoUrl'],
                decoration: InputDecoration(
                  labelText: 'URL da Foto'
                ),
                onSaved: (newPhotoUrl) => {
                  _formData['photoUrl'] = newPhotoUrl!
                },
              ),
            ]
          ),
        ),
      )
    );
  }
}