import 'package:flutter/material.dart';
class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这次演示的似滑动选择器"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 开始使用slider选择器 */
            Slider(
              value: _sliderItemA, 
              onChanged: (value) {
                setState(() {
                  _sliderItemA = value;
                });
                print(value);
              },
              /* 激活部分的颜色 */
              activeColor: Theme.of(context).primaryColor,
              /* 未被激活部分的颜色 */
              inactiveColor: Theme.of(context).primaryColor.withOpacity(.3),
              min: 0.0,
              max: 100,
              divisions: 100,/* 将进度条分为多少份 */
              label: '${_sliderItemA.toInt()}',
            ),
            SizedBox(height: 20,),
            Text('滑动选择器的值为$_sliderItemA')
          ],
        ),
      )
    );
  }
}