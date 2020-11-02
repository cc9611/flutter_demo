import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;
  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: '这是一个初始化面板数据A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('面板初始化数据成功，准备发射，biubiubiu~'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '这是一个初始化面板数据B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('面板初始化数据成功，准备发射，biubiubiu~'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '这是一个初始化面板数据C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('面板初始化数据成功，准备发射，biubiubiu~'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('伸缩面板'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map(
                (ExpansionPanelItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (BuildContext context,bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headerText),
                      );
                    }
                  );
                }
              ).toList(),
            )
          ],
        ),
      )
    );
  }
}
