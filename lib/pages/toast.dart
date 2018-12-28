import 'package:flutter/material.dart';

class ToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试Toast'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    ListView listView = ListView(
      children: <Widget>[
        ListTile(
          title: Text('普通样式'),
          onTap: () {
            OverlayState overlayState = Overlay.of(context);
            OverlayEntry overlayEntry = OverlayEntry(builder: _buildToast);
            overlayState.insert(overlayEntry);
          },
        ),
      ],
    );
    return listView;
  }

  Widget _buildToast(BuildContext context) {
    
    return Positioned.fill(
      top: 32,
      left: 32,
      right: 32,
      child: Text('data'),
    );
  }
}
