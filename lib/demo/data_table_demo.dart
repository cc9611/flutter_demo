import 'package:flutter/material.dart';
import '../model/post.dart';
class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据表格的使用'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            /* 进入正题，样式数据表格 */
            DataTable(
              sortColumnIndex: _sortColumnIndex,/* 按照那个列排序 */
              sortAscending: _sortAscending,/* true为升序排列 */
              // onSelectAll: (value) {/* 全选的状态 */
                
              // } ,
              columns: [
                DataColumn(
                  label: Text('标题'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a,b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  }
                ),
                DataColumn(
                  label: Text('作者')
                ),
                DataColumn(
                  label: Text('图像')
                ),
              ],
              rows: posts.map((posts) {
                return DataRow(
                  selected: posts.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                      if (posts.selected != value) {
                        posts.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(posts.title)),
                    DataCell(Text(posts.author)),
                    DataCell(Image.network(posts.imageUrl)),
                  ]
                );
              }).toList()
            )
          ],
        )
      ),
    );
  }
}