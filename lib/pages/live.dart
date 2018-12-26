import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LivePage extends StatelessWidget {
  static const platform = MethodChannel('ml.edazh/live');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打开原生直播'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.live_tv),
        onPressed: _lanuchLivePage,
      ),
    );
  }

  void _lanuchLivePage() {
    try {
      platform.invokeMethod('launchLivePage');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
