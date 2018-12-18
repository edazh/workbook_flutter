import 'package:flutter/material.dart';
import 'home.dart';
import 'example.dart';
import 'test.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  List<BottomNavigationBarItem> _bottomItems;
  AnimationController _animationController;
  List<Widget> _pages;

  int _currentNav = 0;
  @override
  void initState() {
    super.initState();
    _bottomItems = _buildBottomItems();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _pages = [
      FadeTransition(
        child: HomePage(),
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
      FadeTransition(
        child: ExamplePage(),
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
      FadeTransition(
        child: TestPage(),
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: _pages[_currentNav],
        ),
        BottomNavigationBar(
          items: _bottomItems,
          onTap: _selectNav,
          currentIndex: _currentNav,
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _buildBottomItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.apps),
        title: Text('例子'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.art_track),
        title: Text('测试'),
      ),
    ];
  }

  void _selectNav(int index) {
    setState(() => _currentNav = index);
    _animationController?.forward();
  }
}
