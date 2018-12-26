import 'package:flutter/material.dart';

import 'splash.dart';
import 'guide.dart';
import 'video.dart';
import 'battery.dart';
import 'live.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('启动闪屏'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SplashPage()));
          },
        ),
        ListTile(
          title: Text('引导页'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => GuidePage()));
          },
        ),
        ListTile(
          title: Text('显示Snackbar'),
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('再按一下试试'),
            ));
          },
        ),
        ListTile(
          title: Text('显示PopuMenu'),
          trailing: _PopupMenu(),
        ),
        ListTile(
          title: Text('测试video_player'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => VideoPage()));
          },
        ),
        ListTile(
          title: Text('测试夸平台'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => BatteryPage()));
          },
        ),
         ListTile(
          title: Text('测试打开原生直播页'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => LivePage()));
          },
        ),
      ],
    );
  }
}

enum MenuAction { insert, remove, query, update }

class _PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (val) => print,
      itemBuilder: (BuildContext ctx) {
        return <PopupMenuItem<MenuAction>>[
          PopupMenuItem<MenuAction>(
            value: MenuAction.insert,
            child: ListTile(
              leading: Icon(Icons.insert_link),
              title: Text('insert'),
            ),
          ),
          PopupMenuItem(
            value: MenuAction.remove,
            child: ListTile(
              leading: Icon(Icons.remove_circle),
              title: Text('remove'),
            ),
          ),
          PopupMenuItem(
            value: MenuAction.query,
            child: ListTile(
              leading: Icon(Icons.query_builder),
              title: Text('query'),
            ),
          ),
          PopupMenuItem(
            value: MenuAction.update,
            child: ListTile(
              leading: Icon(Icons.update),
              title: Text('update'),
            ),
          ),
        ];
      },
    );
  }
}
