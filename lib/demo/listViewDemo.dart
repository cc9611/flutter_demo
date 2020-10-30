import 'package:chenchen_demo/demo/post_show.dart';
import 'package:flutter/material.dart';
import 'package:chenchen_demo/model/post.dart';
class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.network(posts[index].imageUrl),
              SizedBox(height: 16.0),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Positioned.fill(child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(.3),
              highlightColor: Colors.white.withOpacity(.1),
              onTap: () {
                debugPrint("用户点击了");
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> PostShow(post: posts[index]))
                );
              },
            ),
          ))
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
    );
  }
}
