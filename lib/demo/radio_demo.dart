import 'dart:ffi';

import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  /* 设置点击方法 */
  /* 当单选按钮的值和群组的值一样的时候就为选中装填 */
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嘿嘿，我是傲娇的单选框'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('你选择的是${_radioGroupA}号玩家,让我们恭喜他'),
            SizedBox(height: 20,),
            RadioListTile(
              value: 0, 
              groupValue: _radioGroupA, 
              onChanged: _handleRadioValueChanged,
              title: Text("你要不要选我_大标题"),
              subtitle: Text("你要不要选我_小标题"),
              secondary: Icon(Icons.filter_1),/* 图标显示 */
              selected: _radioGroupA==0,/* bool类型，是否让选中的radio显示为激活的颜色 */
            ),
            RadioListTile(
              value: 1, 
              groupValue: _radioGroupA, 
              onChanged: _handleRadioValueChanged,
              title: Text("你要不要选我_大标题"),
              subtitle: Text("你要不要选我_小标题"),
              secondary: Icon(Icons.filter_2),/* 图标显示 */
              selected: _radioGroupA==1,/* bool类型，是否让选中的radio显示为激活的颜色 */
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.black,
                ),
                Radio(
                  value: 1, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.black,
                ),
                Radio(
                  value: 2, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}