import 'package:flutter/material.dart';
import 'package:chenchen_demo/model/post.dart';
class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
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
        ],)
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
