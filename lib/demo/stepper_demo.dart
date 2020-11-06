import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 修改默认主题颜色 */
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                currentStep: _currentStep,
                /* 点击跳转步骤，点击触发 */
                onStepTapped: (value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                /* 点击下一步跳转 */
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('登录'),
                    subtitle: Text('这是一个副标题'),
                    content: Text('这小逼仔用了一个组件插入'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('登录'),
                    subtitle: Text('这是一个副标题'),
                    content: Text('这小逼仔用了一个组件插入'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('登录'),
                    subtitle: Text('这是一个副标题'),
                    content: Text('这小逼仔用了一个组件插入'),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
