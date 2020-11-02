import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嘿嘿，我是复选框😁'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 复选框列表的组合模式 */
            CheckboxListTile(
                value: _checkboxItemA,
                title: Text('这是复选框的大标题😞'),
                subtitle: Text("悄悄的告诉你我是小标题😨"),
                // secondary: Text('这是次要的'),/* 这里能图片或者是文字 */
                secondary: Icon(Icons.battery_charging_full),
                onChanged: (value) {
                  setState(() {
                    _checkboxItemA = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* 复选框的使用 */
                Checkbox(
                    /* 复选框的值，为true 或者 false */
                    value: _checkboxItemA,
                    /* 选中后的颜色 */
                    activeColor: Colors.red,
                    /* 执行的回调函数 */
                    onChanged: (value) {
                      setState(() {
                        _checkboxItemA = value;
                      });
                    }
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
