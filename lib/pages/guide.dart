import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: PageView(
        children: <Widget>[
          Text('第一页'),
          Text('第二页'),
          Text('第三页'),
        ],
      ),
    );
  }
}
