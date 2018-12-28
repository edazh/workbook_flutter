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
    print('initState');
    _bottomItems = _buildBottomItems();
    _pages = [
      HomePage(),
      ExamplePage(),
      TestPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter练习册'),
      ),
      body: AnimatedSwitcher(
        child: _pages[_currentNav],
        duration: Duration(milliseconds: 300),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        onTap: _selectNav,
        currentIndex: _currentNav,
      ),
    );
  }

  // bool _shouldQuit = false;
  // Future<bool> _onWillPop() {
  //   if (!_shouldQuit) {
  //     _shouldQuit = true;
  //     print('再按一下试试');
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text('再按一下试试'),
  //     ));
  //     Timer(Duration(seconds: 2), () => _shouldQuit = false);

  //     return Future.value(false);
  //   }
  //   return Future.value(_shouldQuit);
  // }

  List<BottomNavigationBarItem> _buildBottomItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页'),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            Icon(Icons.apps),
          ],
        ),
        title: Text('例子'),
        backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_box),
        title: Text('测试'),
        backgroundColor: Colors.cyan,
      ),
    ];
  }

  ///底部导航被点击
  void _selectNav(int index) {
    if (_currentNav == index) return;
    setState(() => _currentNav = index);
    _animationController?.forward();
  }
}
