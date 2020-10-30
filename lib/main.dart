// import 'package:chenchen_demo/page/home.dart';
import 'package:flutter/material.dart';
import 'package:chenchen_demo/demo/listViewDemo.dart';
import 'package:chenchen_demo/demo/hello-demo.dart';
import './demo/drawer-demo.dart';
import './demo/bottomNavigationBar-demo.dart';
import './demo/basic-demo.dart';
import './demo/layout_demo.dart';
import 'package:chenchen_demo/demo/view_demo.dart';
import './demo/sliver_demo.dart';
import 'package:flutter/rendering.dart';
void main() => runApp(App());
/*  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter i'm comming"),
        ),
        body: HomePage(),
      ),
    ) */
/* 应用入口，设置主题主页 */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled=true;/* 显示网格 需要导入import 'package:flutter/rendering.dart'; */
    // 设置使用主题
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // 对主题进行设置
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white30
      ),
    );
  }
}

// 主页面
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 主页TabBar，头部
    return DefaultTabController(
      length: 4,
      // scaffold脚手架
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        // 标题头部正式开始
        appBar: AppBar(
          title: Text('陈晨'),
          elevation: 0.0,
          centerTitle: true,
          // 响应内容 actions
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search), tooltip: 'Navigration', onPressed: ()=> debugPrint('按了一下搜索')
            )
          ],
          // 头部兰的底部，就是Tabs
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black45,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.satellite)),
              Tab(icon: Icon(Icons.face)),
              Tab(icon: Icon(Icons.healing)),
              Tab(icon: Icon(Icons.satellite)),
            ],
          ),
        ),
        // body: ListViewDemo()
        // body: Hello()
        // BODY主体 Tab栏中的内容
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            SliverDemo(),
            ViewDemo(),
            // Icon(Icons.healing,size:128.0,color: Colors.black38,),
          ],
        ),
        /* 抽屉 */
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      )
    );
  }
}



