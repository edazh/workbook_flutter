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

///确认取消
class Confirm extends StatelessWidget {
  const Confirm(
      {Key key,
      this.title,
      this.content,
      this.confirmText = '确定',
      this.cancelText = '取消'})
      : assert(confirmText != null),
        assert(cancelText != null),
        super(key: key);
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title),
      content: content == null ? null : Text(content),
      actions: <Widget>[
        FlatButton(
          textTheme: ButtonTextTheme.normal,
          onPressed: () => Navigator.of(context).pop(DialogAction.cancel),
          child: Text(cancelText),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(DialogAction.confirm),
          child: Text(confirmText),
        )
      ],
    );
  }
}

///加载中
class Loading extends StatelessWidget {
  const Loading({Key key, this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [CircularProgressIndicator()];
    if (content != null && content.isNotEmpty) {
      children.add(Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(content),
      ));
    }
    Widget child = Card(
      elevation: 24,
      margin: EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
    return Center(child: child);
  }
}
