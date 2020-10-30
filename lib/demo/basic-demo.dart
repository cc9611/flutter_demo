import 'package:flutter/material.dart';


class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600494201755&di=593c60d6b873b4e32a603d1fca8b36d3&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201607%2F07%2F20160707224413_yWKet.jpeg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.greenAccent.withOpacity(0.15), BlendMode.hardLight)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: (
              Container(
                child: Icon(Icons.battery_charging_full,size: 33.0,color: Colors.indigo,),
                // color: Colors.cyan,
                height: 70.0,
                width: 70.0,
                padding: EdgeInsets.all(11.0),
                margin: EdgeInsets.all(11.0),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  border: Border.all(
                    color: Colors.indigo,
                    style: BorderStyle.solid,
                    width: 3.0
                  ),
                  // borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(8.0,8.0),
                      color: Colors.indigo[300],
                      blurRadius: 10.0,
                      spreadRadius: 3.0
                    ),
                  ],
                  shape: BoxShape.circle,
                  /* gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(123, 83, 154, 1),
                      Color.fromRGBO(23, 79, 122, 1),
                    ]
                  ) */
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(53, 43, 154, 1),
                      Color.fromRGBO(23, 119, 22, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0
  );
  final String  _title = '将进酒';
  final String  _author = '李白';
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'SUPER',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w100,
          fontSize: 33.0,
          fontStyle: FontStyle.italic,
        ),
        children: [
          TextSpan(
            text: ' man $_author'.toUpperCase(),
          )
        ]
      ),
    );
    /* return Text(
      '《$_title》 --$_author   君不见黄河之水天上来，奔流到海不复回,君不见高堂明镜悲白发，朝如青丝暮成雪,天生我材必有用，千金散尽还复来',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  } */
  }
}