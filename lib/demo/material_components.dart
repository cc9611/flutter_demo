import 'package:chenchen_demo/demo/popup_menu_button_demo.dart';
import 'package:flutter/material.dart';
import '../demo/button_demo.dart';
class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'ButtonDemo',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(),
          ),
        ],
      ),
    );
  }
}



class _WidgetDemo extends StatelessWidget {
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
          children: [],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () => {},
    child: Icon(Icons.add),
    backgroundColor: Colors.orange,
    /* 设置floating Action Button的形状 */
    shape: BeveledRectangleBorder(
        /* 圆角设置为30时会显示菱形 */
        // borderRadius: BorderRadius.circular(10)
        ),
  );

  /* 定义带文字形式的floatringActionButton */
  final Widget _floatingActionButtonExtend = FloatingActionButton.extended(
      onPressed: () {}, icon: Icon(Icons.add), label: Text('那岂不是使劲加'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        // elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      /* 设置浮动按钮的位置  底部工具栏的中间并且重合*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /* 底部工具栏 */
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        /* 设置底部工具栏的缺口，给浮动按钮留个小旮旯 */
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
      },
    );
  }
}
