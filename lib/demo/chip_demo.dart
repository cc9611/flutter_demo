import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'lemon'
  ];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip😁'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 16.0,
              /* 个顶个的间隔 */
              runSpacing: 8.0,
              /* 行与行之间的间隔 */
              children: [
                Chip(
                  label: Text('Sun'),
                ),
                Chip(
                  label: Text('Smile'),
                  backgroundColor: Colors.pink[300],
                ),
                Chip(
                  label: Text('Chen'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.pink[300],
                    child: Text('晨'),
                  ),
                ),
                Chip(
                  label: Text('神'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.pink[300],
                    child: Text('天'),
                  ),
                  /* 标签小碎片删除函数 */
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,/* 删除图标颜色 */
                  deleteButtonTooltipMessage: '寸生拳',/* 删除提示 */

                ),
                Chip(
                  label: Text('Smile如果这是一个超级大的微笑会特别长'),
                  backgroundColor: Colors.pink[300],
                ),
                /* 当当当当，这是一个分隔符线 */
                Divider(
                  color: Colors.grey,
                  height: 20.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList()
                ),
                Divider(
                  color: Colors.grey,
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('当前选中：$_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList()
                ),
                Divider(
                  color: Colors.grey,
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('当前选中FilterChip：${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList()
                ),
                Container(
                  width: double.infinity,
                  child: Text('当前选中ChoiceChip：${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black26,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList()
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore_from_trash),
        onPressed: () {
          setState(() {
            _tags=[
              'Apple',
              'banana',
              'lemon'
            ];
            _selected=[];
            _choice='lemon';
          });
        },
      ),
    );
  }
}
