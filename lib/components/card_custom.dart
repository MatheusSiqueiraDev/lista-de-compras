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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
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
          elevation: 0,
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          child: ListTile(
            onTap: click,
            leading: iconCard,
            title: titleCard,
            subtitle: subtitleCard,
            trailing: actionsCard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
            ),
          ),
        )
      )
    );
  }
}