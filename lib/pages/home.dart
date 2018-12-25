import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Center(
        child: Text(
          '首页',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }

  bool _shouldQuit = false;
  Future<bool> _onWillPop() {
    if (!_shouldQuit) {
      _shouldQuit = true;
      print('再按一下试试');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('再按一下试试'),
      ));
      Timer(Duration(seconds: 2), () => _shouldQuit = false);

      return Future.value(false);
    }
    return Future.value(_shouldQuit);
  }
}
