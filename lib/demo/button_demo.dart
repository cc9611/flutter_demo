import 'package:flutter/material.dart';
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.pink,
        ),
        FlatButton.icon(
          icon: Icon(Icons.battery_full),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          // textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              // textTheme: ButtonTextTheme.primary,
              shape: StadiumBorder(), /* 露天运动场的邢壮 */
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0)
              // ),
            ),
          ),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            /* outlinebutton中不能使用elevation */
            // elevation: 0.0,/* 原来你就是阴影 */
            // textColor: Colors.white,/* 文字颜色 */
            // color: Colors.green,/* 背景色 */
            // textTheme: ButtonTextTheme.primary,
            highlightColor: Colors.grey,
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.battery_full),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          // elevation: 10,
        ),
      ],
    );

    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190,
          child: (OutlineButton(
            shape: StadiumBorder(),
            /* 露天运动场的邢壮 */
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey,
            borderSide: BorderSide(color: Colors.black),
          )),
        )
      ],
    );

    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          /* 默认占满剩余的整个宽度 ，可以设置flex*/
          child: (OutlineButton(
            shape: StadiumBorder(),
            /* 露天运动场的邢壮 */
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey,
            borderSide: BorderSide(color: Colors.black),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          /* 默认占满剩余的整个宽度 ，可以设置flex*/
          flex: 2,
          child: (OutlineButton(
            shape: StadiumBorder(),
            /* 露天运动场的邢壮 */
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey,
            borderSide: BorderSide(color: Colors.black),
          )),
        )
      ],
    );

    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              // textTheme: ButtonTextTheme.accent,
            ),
          ),
          child: ButtonBar(
            /* 水平方向的按钮容器，能放下一排带边距的button */
            children: [
              OutlineButton(
                shape: StadiumBorder(),
                /* 露天运动场的邢壮 */
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey,
                borderSide: BorderSide(color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              OutlineButton(
                shape: StadiumBorder(),
                /* 露天运动场的邢壮 */
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey,
                borderSide: BorderSide(color: Colors.black),
              )
            ],
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flatButtonDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}