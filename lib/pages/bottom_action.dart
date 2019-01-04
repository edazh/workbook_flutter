import 'package:flutter/material.dart';

class BottomActionPage extends StatefulWidget {
  @override
  BottomActionPageState createState() {
    return new BottomActionPageState();
  }
}

class BottomActionPageState extends State<BottomActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Sheet')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('显示BottomSheet'),
            onTap: _showBottomSheet,
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return BottomSheet(
            onClosing: () {},
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints.expand(height: 48),
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'data',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints.expand(height: 48),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'data',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: SizedBox(
                      height: 16,
                      width: double.infinity,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints.expand(height: 48),
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'data',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
