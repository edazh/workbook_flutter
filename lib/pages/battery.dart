import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryPage extends StatefulWidget {
  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  static const platform = const MethodChannel('ml.edazh/battery');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试平台特定代码：电量')),
      body: Center(
        child: Text(
          _batteryLevel,
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.power),
        onPressed: _getBatteryLevel,
      ),
    );
  }

  String _batteryLevel = 'Unknow battery level';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result %';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
