import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageViewDemo();
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            alignment:Alignment.topCenter,
            children: <Widget>[
              SizedBox(
                width: 300.0,
                height: 300.0,
                child: Container(
                  alignment: Alignment(1,1),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(Icons.add_circle,color: Colors.white,size: 25.0,),
                ),
              ),
              // SizedBox(
              //   height: 30.0,
              // ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  alignment: Alignment(1,1),
                  decoration: BoxDecoration(
                    color: Colors.indigo[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(Icons.desktop_mac,color: Colors.white,size: 25.0,),
                ),
              ),
              Positioned(right:212,bottom:111,child: Icon(Icons.ac_unit,color:Colors.white,size:44,)),
              Positioned(right:52,bottom:261,child: Icon(Icons.ac_unit,color:Colors.white,size:14,)),
              Positioned(right:122,bottom:151,child: Icon(Icons.ac_unit,color:Colors.white,size:34,)),
              Positioned(right:2,bottom:21,child: Icon(Icons.ac_unit,color:Colors.white,size:24,)),
            ],
          )
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  
  IconBadge(this.icon,{this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      width: size + 60,
      height: size + 60,
      color: Colors.greenAccent,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      /* 能滑动到任意位置  如果为true，每次滑动显示整个容器*/
      // pageSnapping: false,
      /* 反转容器 */
      // reverse: true,
      /* 垂直滑动*/
      // scrollDirection: Axis.vertical,
      /* 页面滑动后的回调函数 */
      onPageChanged: (currentPage) => debugPrint('page:$currentPage'),
      controller: PageController(
        /* 控制初始显示页面 */
        initialPage: 1,
        /* 是否保存初始显示位置 */
        keepPage: false,
        /* 占可视口的比例 */
        viewportFraction: 0.85

      ),
      children: [
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0, 0),
          child: Text('one',style: TextStyle(fontSize: 32.0,color: Colors.white)),
        ),
        Container(
          color: Colors.brown[400],
          alignment: Alignment(0, 0),
          child: Text('two',style: TextStyle(fontSize: 32.0,color: Colors.white)),
        ),
        Container(
          color: Colors.brown[200],
          alignment: Alignment(0, 0),
          child: Text('three',style: TextStyle(fontSize: 32.0,color: Colors.white)),
        ),
      ],
    );
  }
}