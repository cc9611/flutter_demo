import 'package:flutter/material.dart';

enum Option {
  A,B,C
}
enum Sel {
  A,B
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';
  String _choiceA = '选';

  
  Future _openSimpleDialog() async {
    final option =  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('请选择你心仪的选手'),
          children: [
            SimpleDialogOption(
              child: Text('杨幂'),
              onPressed: () {
                Navigator.pop(context,Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('杨玉环'),
              onPressed: () {
                Navigator.pop(context,Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('貂蝉'),
              onPressed: () {
                Navigator.pop(context,Option.C);
              },
            ),
          ],
        );
      },
    );
    switch (option) {
      case Option.A:
        setState(() {
          _choice = '杨幂';
        });
        break;
      case Option.B:
        setState(() {
          _choice = '杨玉环';
        });
        break;
      case Option.C:
        setState(() {
          _choice = '貂蝉';
        });
        break;
      default:
    }
    
  }

  _openAlertDialog() async {
    final option =  await showDialog(
      context: context,
      /* 如果设置为false,则点击对话框外的位置不会关闭对话框 */
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('提示对话狂'),
          content: Text('你知道中午吃什么吗'),
          /* 对话框的按钮,能确认和关闭 */
          actions: [
            FlatButton(
              child: Text('点我'),
              onPressed: () {
                Navigator.pop(context,Sel.A);
              },
            ),
            FlatButton(
              child: Text('点他',),
              onPressed: () {
                Navigator.pop(context,Sel.B);
              },
            ),
            // Text('我在这里也能随便添加内容真不知道如果内容超出了提示框会发生什么现象')
          ],
        );
      },
    );
    switch (option) {
      case Sel.A:
        setState(() {
          _choiceA = '恭喜你选择了我';
        });
        break;
      case Sel.B:
        setState(() {
          _choiceA = '你凭什么没有选我';
        });
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框<(￣3￣)> '),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('你选择的是$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: _openAlertDialog, child: Icon(Icons.desktop_windows),),
                Text('下面我们来揭晓答案  $_choiceA'),
                FlatButton(onPressed: _openSimpleDialog, child: Icon(Icons.format_list_numbered),),
              ],
            )
          ],
        ),
      ),
    );  
  } 
}