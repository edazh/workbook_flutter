import 'package:flutter/material.dart';
import './pages/index.dart';
import './pages/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workbook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
      onGenerateRoute: _generateRoute,
    );
  }

  ///生成路由
  Route _generateRoute(RouteSettings settings) {
    if (settings.name != '/splash') {
      return null;
    }
    return MaterialPageRoute(
      builder: (BuildContext context) => SplashPage(),
      settings: settings
    );
  }
}
