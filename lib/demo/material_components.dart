import 'package:chenchen_demo/demo/datetime_demo.dart';
import 'package:chenchen_demo/demo/expansion_panel_demo.dart';
import 'package:chenchen_demo/demo/popup_menu_button_demo.dart';
import 'package:chenchen_demo/demo/radio_demo.dart';
import 'package:chenchen_demo/demo/slider_demo.dart';
import 'package:chenchen_demo/demo/snack_bar_demo.dart';
import 'package:chenchen_demo/demo/switch_demo.dart';
import 'package:flutter/material.dart';
import '../demo/button_demo.dart';
import 'bottom_sheet_demo.dart';
import 'dialog_demo.dart';
import 'form_demo.dart';
import 'checkbox_demo.dart';
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
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'CheckBox',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: '下面我要用中文，哼😠',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: '来，让我们见识一下单选框',
            page: RadioDemo(),
          ),
          ListItem(
            title: '来，让我们见识一下开关',
            page: SwitchDemo(),
          ),
          ListItem(
            title: '来，让我们见识一下滑动选择器',
            page: SliderDemo(),
          ),
          ListItem(
            title: '来，让我们见识一下国际化组件',
            page: DatetimeDemo(),
          ),
          ListItem(
            title: '可爱的对话框框😊',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: '这个叫做底部对话框',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBar展示',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: '伸缩面板',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'chip小碎片',
            page: ExpansionPanelDemo(),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            )
          ],
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


/* 构建视图列表 点击 跳转进新的页面 */
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
