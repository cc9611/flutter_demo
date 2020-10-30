import 'package:flutter/material.dart';
class NavigatorDeom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: null, child: Text('Home')),
            FlatButton(onPressed: () {
              /* 使用路由名称跳转 */
              Navigator.pushNamed(context, '/about');
              /* Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Page(title: '大标题')
                ),
              ); */
            }, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}

/* 新的页面 点击跳转 */
class Page extends StatelessWidget {
  final String title;
  Page({
    this.title
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mood_bad),
        onPressed: () => {
          Navigator.pop(context)
        },
      ),
    );
  }
}

