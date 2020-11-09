import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('状态管理1'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,/* 重建的时候不进行数据刷新 */
          builder: (context, child, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        )
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => 
      ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({this.count,this.increaseCount, this.child}) : super(child: child);
  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

/* 利用Scoped包定义的组件  直接能用里面的值*/
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}