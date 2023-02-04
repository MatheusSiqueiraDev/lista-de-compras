import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_compras/style/theme_custom.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final String? titleCustom;
  final List<Widget>? actionsCustom;

  AppBarCustom({required this.titleCustom, this.actionsCustom});

  @override 
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        titleCustom!,
        style: Theme.of(context).textTheme.bodyMedium
      ),
      actions: actionsCustom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}