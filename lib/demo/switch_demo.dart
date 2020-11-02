import 'package:flutter/material.dart';
class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这次演示的似开关的使用Switch"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            value: _switchItemA,
            onChanged: (value) {
              setState(() {
                _switchItemA= value;
              });
            },
            title: Text("这可是人家的大标题哦😄"),
            subtitle: Text("不能瞧不起小标题🌬"),
            secondary: Icon(_switchItemA?Icons.visibility:Icons.visibility_off,size: 32,),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_switchItemA?'😄':'😭',style: TextStyle(fontSize: 32.0),),
              Switch(
                value: _switchItemA, 
                onChanged: (value) {
                  setState(() {
                    _switchItemA = value;
                  });
                }
              )
            ],
          )
        ],
      ),
      )
    );
  }
}