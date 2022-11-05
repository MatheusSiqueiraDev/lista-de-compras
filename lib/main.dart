import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:lista_compras/views/list_form.dart';
import 'package:lista_compras/views/products_form.dart';
import 'package:lista_compras/views/products_list.dart';
import 'package:lista_compras/views/shopping_list.dart';
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
      statusBarColor: Color.fromARGB(255, 26,26,26)
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetData()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de Compra',
        theme: ThemeData(
          scaffoldBackgroundColor:  Color.fromARGB(255, 26,26,26),
          textTheme: GoogleFonts.sourceSansProTextTheme(
            Theme.of(context).textTheme
          ),
        ),
        home: ShoppingList(),
        routes: {
          AppRoutes.PRODUCT_FORM: ((context) => ProductsForm()),
          AppRoutes.PRODUCT_LIST: ((context) => ProductList()),
          AppRoutes.LIST_FORM:(context) => ListsForm()
        },
      ),
    );
  }
}