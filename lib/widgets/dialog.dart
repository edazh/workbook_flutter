import 'package:flutter/material.dart';

enum DialogAction { confirm, cancel }

///确认对话框
class Alert extends StatelessWidget {
  const Alert({Key key, this.title, this.content, this.confirmText = '确定'})
      : assert(confirmText != null),
        super(key: key);
  final String title;
  final String content;
  final String confirmText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title),
      content: content == null ? null : Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(DialogAction.confirm),
          child: Text(confirmText),
        )
      ],
    );
  }
}


