import 'package:flutter/material.dart';

class RemoveAllElements extends StatelessWidget {
  final int condition;
  final String message;
  final Function action;
  
  RemoveAllElements({required this.condition, required this.message, required this.action});

  @override 
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(condition > 0) {
          showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                title: Text(message),
                content: Text(
                  'Tem certeza?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Não')
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Sim')
                  ),
                ],
              )
          ).then((response) {
            print(response);
            if(response) {
              action();
            }
          });
        }

        if(condition <= 0) {
            showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text('Não tem item na lista.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('OK')
                    ),
                  ],
                )
            );
        }
      }, 
      icon: const Icon(Icons.remove_outlined),
    );
  }
}