import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/dialog.dart' as dialog;

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DialogPage')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('AlertDialog'),
            onTap: () async {
              dialog.DialogAction action =
                  await showDialog<dialog.DialogAction>(
                context: context,
                builder: (_) =>
                    const dialog.Alert(title: 'Alert标题', content: 'Alert内容'),
              );
              _logAction(action);
            },
          ),
          ListTile(
            title: Text('ConfirmDialog'),
            onTap: () async {
              dialog.DialogAction action =
                  await showDialog<dialog.DialogAction>(
                context: context,
                builder: (_) => const dialog.Confirm(
                      title: '标题',
                      content: '内容',
                      confirmText: '知道了',
                    ),
              );
              _logAction(action);
            },
          ),
          ListTile(
            title: Text('LoadingDialog'),
            onTap: () {
              showDialog<dialog.DialogAction>(
                context: context,
                builder: (_) => const dialog.Loading(content: '正在加载'),
              );
            },
          ),
        ],
      ),
    );
  }

  ///打印所按下的按钮动作类型
  void _logAction(dialog.DialogAction action) {
    print('你点击的按钮是：$action');
  }
}
