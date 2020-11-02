import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('这是一个SnackBottom的展示'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SnackBarButton()],
              )
            ],
          ),
        ));
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('点击我来展示底部Snack'),
      onPressed: () {
        /* 点击显示Snackbar */
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('正在玩命加载,请稍后...'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {},
          ),
        ));
      },
    );
  }
}
