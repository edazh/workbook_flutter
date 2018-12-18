import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('例子')),
      body: _buildBody(context),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Text(
        '例子',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
