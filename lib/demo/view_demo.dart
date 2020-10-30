import 'package:flutter/material.dart';
import 'package:chenchen_demo/model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuildDemo(
      
    );
  }
}

class GridViewBuildDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context,int index){
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

class GirdViewCountExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey,
        alignment: Alignment(0,0),
        child: Text('Item$index',style: TextStyle(color: Colors.black38,fontSize: 15),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      /* extent中不能有crossAxisCount */
      // crossAxisCount: 3,
      maxCrossAxisExtent:150,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class GirdViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey,
        alignment: Alignment(0,0),
        child: Text('Item$index',style: TextStyle(color: Colors.black38,fontSize: 15),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index){
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
            ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemCount: posts.length,itemBuilder: _pageItemBuilder);
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      /* 定义滑动位置，默认值为false */
      // pageSnapping: false,
      /* 翻转顺序，默认false */
      // reverse: true,
      /* 上下滑动 */
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage)=>{debugPrint('curretnPage is $currentPage')},
      controller: PageController(
        initialPage: 1,
        // keepPage: false,
        viewportFraction: 0.9
      ),
      children: <Widget>[
        Container(
          color: Colors.orange,
          alignment: Alignment(0,0),
          child: Text(
            'ONE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33.0
            )
          ),
        ),
        Container(
          color: Colors.purple,
          alignment: Alignment(0,0),
          child: Text(
            'TWO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33.0
            )
          ),
        ),
        Container(
          color: Colors.blueGrey,
          alignment: Alignment(0,0),
          child: Text(
            'THREE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33.0
            )
          ),
        ),
      ],
    );
  }
}