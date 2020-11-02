import 'package:flutter/material.dart';
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey
      .currentState
        .showBottomSheet((BuildContext context) {
          return BottomAppBar(
            child: Container(
              height: 90.0,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.pause_circle_outline),
                  SizedBox(width: 16.0,),
                  Text('01:21 / 03:20'),
                  Expanded(child: Text('蓝莲花 - 许巍', textAlign: TextAlign.right,))
                ],
              ),
            ),
          );
        });
  }

  _openModalBottomSheet() async {
    final modalSheet = await showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('请选择杨玉环'),
                onTap: () {
                  Navigator.pop(context,'携带了一个杨玉环');
                },
              ),
              ListTile(
                title: Text('请选择杨幂'),
                onTap: () {
                  Navigator.pop(context,'携带了一个杨幂');
                },
              ),
              ListTile(
                title: Text('请选择杨戬'),
                onTap: () {
                  Navigator.pop(context,'携带了一个杨戬');
                },
              ),
            ],
          ),
        );
      }
    );
    print(modalSheet);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('这可能就是高端但是不兼容的底部对话框'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text('这是一个底部对话框入口'),
                  onPressed: _openBottomSheet,
                ),
                FlatButton(
                  child: Text('这是一个模型底部对话框入口'),
                  onPressed: _openModalBottomSheet,
                ),
              ],
            )
          ],
        ),
      ),
      
    );
  }
}