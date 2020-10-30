import 'dart:ffi';

import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.orange
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RigisterForm(),
            ],
          ),
        )
      ),
    );
  }
}

/* 登录框 */
class RigisterForm extends StatefulWidget {
  @override
  _RigisterFormState createState() => _RigisterFormState();
}

class _RigisterFormState extends State<RigisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  /* 点击提交后的方法 */
  Void submitRegisterForm() {
    /* 如果手动验证通过则打印信息 否则开启自动验证 */
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();/* v保存当前表单填写的数据 */
      debugPrint('username:${username}');
      debugPrint('password:${password}');
      /* 如果输入正确则底部弹出动画提示 */
      Scaffold.of(context).showSnackBar(
       SnackBar(content: Text('正在登陆'))
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUserName(value) {
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: ''
            ),
            onSaved: (value) => username = value,
            validator: validateUserName,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'PassWord',
              helperText: ''
            ),
            onSaved: (value) => password = value,
            validator: validatePassWord,
            autovalidate: autovalidate,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.red,
              child: Text('登录', style: TextStyle(color: Theme.of(context).primaryColor),),
              // elevation: 0.0,
              onPressed: submitRegisterForm,/* 创建一个新方法，按下提交调用这个方法 */
            ),
          )
        ],
      ),
    );
  }
}



/* 文本框 */
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = '你打不过我';/* 设置文本框初始值 */
    textEditingController.addListener(() {debugPrint('监听文本框的值为 ${textEditingController.text}');});
  }

  @override
  Widget build(BuildContext context) {
    /* 返回一个文本输入域 */
    return TextField(
      controller: textEditingController,
      // onChanged: (value) => debugPrint('输入发生了改变，内容为$value'),
      onSubmitted: (value) => debugPrint('输入完成，内容为$value'),
      decoration: InputDecoration(
        icon: Icon(Icons.dashboard),
        labelText: 'Title',/* 文本框标题 */
        hintText: '请大哥输入内容',
        // border: InputBorder.none,/* 隐藏文本框 外框 */
        // border: OutlineInputBorder(),/* 一个大框框给包起来 */
        // filled: true,/* filled风格，添加了一个灰色的背景 */
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}