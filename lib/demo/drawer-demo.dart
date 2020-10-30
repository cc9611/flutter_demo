import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          // 抽屉的子类
          child: ListView(
            padding: EdgeInsets.zero,
            // listview下的子类是widget格式
            children: <Widget>[
              /* 抽屉头部 */
              // DrawerHeader(
              //   child: Text('header'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100]
              //   ),
              // ),
              /* 抽屉头部用用户信息 */
              UserAccountsDrawerHeader(
                accountName: Text('chenchen', style: TextStyle(fontWeight: FontWeight.bold),), 
                accountEmail: Text('601888@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('http://pics4.baidu.com/feed/279759ee3d6d55fb59f3dcac6dd1e44c21a4dd79.jpeg?token=f3719f58bc7103cdb7b7697a700833b0'),
                ),
                /* 抽屉头部用户背景设置 */
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  image: DecorationImage(
                    image: NetworkImage('https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1421768554,2275816689&fm=26&gp=0.jpg'),
                    fit: BoxFit.cover, 
                    colorFilter: ColorFilter.mode(Colors.yellow[20], BlendMode.hardLight)
                  )
                ),
              ),
              /* 抽屉子元素 */
              ListTile(
                title: Text('Messages',textAlign: TextAlign.right,),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('favorite',textAlign: TextAlign.right,),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('settings',textAlign: TextAlign.right,),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        );
  }
}