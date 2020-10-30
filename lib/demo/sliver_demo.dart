import '../model/post.dart';
import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('鬼刀'),
            centerTitle: true,
            // pinned: true,/* 如果为false则不隐藏，一直显示 */
            floating: true,/* 向上滑动隐藏，向下滑动显示 */

            /* 设置弹性伸缩盒子 */
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('i have a dream'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              background: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603986199802&di=bc7cdf3984c5cae528c94b405ecaac8e&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2F201503%2F19%2F211608ztcq7higicydxhsy.jpg',
              fit: BoxFit.cover,),
            ),

          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(18.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount: posts.length,
              ));
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 22.0),
          child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0, //阴影
              shadowColor: Colors.grey.withOpacity(0.9),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        Text(posts[index].author,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
      childCount: posts.length
    ));
  }
}
