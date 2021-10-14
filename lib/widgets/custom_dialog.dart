import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants.dart';

class CustomDialog extends StatelessWidget {

  final String title;
  final String message;
  final Function onPressed;

  CustomDialog({required this.title, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text(RESET_LABEL),
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
        )
      ],
    );
  }
}