import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;
  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  void _sort(getField(post),bool ascending) {
    _posts.sort((a,b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();/* 发生改变后调用 */
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {

  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

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
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,/* 按照那个列排序 */
              sortAscending: _sortAscending,/* true为升序排列 */
              // onSelectAll: (value) {/* 全选的状态 */} ,
              header: Text('Posts'),
              source: _postDataSource,
              rowsPerPage: 5,/* 每页数量 */
              columns: [
                DataColumn(
                  label: Text('标题'),
                  onSort: (int columnIndex, bool ascending) {
                    _postDataSource._sort((post) => post.title.length, ascending);
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
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
              
            )
          ],
        )
      ),
    );
  }
}