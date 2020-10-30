import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      backgroundColor: Colors.yellow[400],
      type: BottomNavigationBarType.fixed,
      /* 选中后的颜色 */
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.add_box,size: 32,),title: Text('')),
        BottomNavigationBarItem(icon: Icon(Icons.image,size: 32,),title: Text('')),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard,size: 32,),title: Text('')),
        // BottomNavigationBarItem(icon: Icon(Icons.hotel),title: Text('hotel')),
        // BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
      ],
    );
}
}