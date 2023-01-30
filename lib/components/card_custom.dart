import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardCustom extends StatelessWidget {

  final Function? actionEndToStart;
  final Function? actionStartToEnd;
  final Widget? containerActionEndToStart;
  final Widget? containerActionStartToEnd;
  final Text? titleCard;
  final Text? subtitleCard;
  final Widget? actionsCard;
  final CircleAvatar? iconCard;
  final VoidCallback? click;

  CardCustom({
    this.actionEndToStart, 
    this.actionStartToEnd, 
    this.containerActionEndToStart,
    this.containerActionStartToEnd,
    this.titleCard,
    this.subtitleCard,
    this.actionsCard,
    this.iconCard,
    this.click
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 0, right: 0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 58, 58, 58).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2), 
          )
        ]
      ),
      child: Dismissible(
        key: UniqueKey(), 
        onDismissed: (DismissDirection direction) {
          if(direction == DismissDirection.endToStart) {
            if(actionEndToStart != null) {
              actionEndToStart!();
            }
          }

          if(direction == DismissDirection.startToEnd) {
            if(actionStartToEnd != null) {
              actionStartToEnd!();
            }
          }
        },
        background: containerActionStartToEnd,
        secondaryBackground: containerActionEndToStart,
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          color: const Color.fromARGB(255, 42,42,42),
          child: ListTile(
            onTap: click,
            leading: iconCard,
            title: titleCard,
            subtitle: subtitleCard,
            trailing: actionsCard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        )
      )
    );
  }
}