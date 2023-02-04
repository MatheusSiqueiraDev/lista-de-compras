import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/components/round_container.dart';

class ListViewCustom extends StatelessWidget {
  final int qtyList;
  final Function builderList;
  final Function? scrollButton;

  ListViewCustom({
    required this.qtyList, 
    required this.builderList, 
    this.scrollButton,
  });

  @override 
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundContainer(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            final double maxScroll = notification.metrics.maxScrollExtent;

            if(maxScroll > 0) {
              if (direction == ScrollDirection.reverse) {
                scrollButton!(false);
              } 

              if (direction == ScrollDirection.forward) {
                scrollButton!(true);
              }
            }
            return true;
          },
          child: ListView.builder(
            itemCount: qtyList,
            itemBuilder: (context, index) => builderList(index),
          ),
        ),  
      ),
    );
  }
}