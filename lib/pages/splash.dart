import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),//禁用返回
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: <Widget>[
            Center(
              child: FlutterLogo(
                size: 128,
                style: FlutterLogoStyle.stacked,
              ),
            ),
            Positioned(
              child: Colock(),
              top: 64,
              right: 32,
            ),
          ],
        ),
      ),
    );
  }
}

class Colock extends StatefulWidget {
  @override
  _ColockState createState() => _ColockState();
}

class _ColockState extends State<Colock> {
  int _duration = 3;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() => _duration--);
      if (_duration == 0) {
        Navigator.of(context).pop();
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: CircleBorder(),
      padding: EdgeInsets.all(16),
      child: Text('跳过$_duration'),
      onPressed: () {},
    );
  }
}
