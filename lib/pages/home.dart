import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: _buildBody(context),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Text(
        '首页',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
