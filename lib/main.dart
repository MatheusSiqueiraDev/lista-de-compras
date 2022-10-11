import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:lista_compras/views/products_form.dart';
import 'package:lista_compras/views/products_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: ProductList(),
        routes: {
          AppRoutes.PRODUCT_FORM: ((context) => ProductsForm()),
        },
      ),
    );
  }
}