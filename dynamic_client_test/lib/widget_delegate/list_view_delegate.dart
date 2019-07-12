import 'package:flutter/widgets.dart';

/**
 * 用于支持GridView/ListView.builder方法创建列表
 * 支持itembuilder（但仅支持item都是同一种样式的情况），不支持scrollcontroller
 */
class ListViewDelegateWidget extends StatelessWidget {
  final ListViewParams params;
  ListViewDelegateWidget(this.params);
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class ListViewParams {
  Axis scrollDirection = Axis.vertical;
  bool reverse = false;
  bool primary = false;
  bool shrinkWrap = false;
  EdgeInsetsGeometry padding;
  double itemExtent;
  String dataSetExp; //该list view的数据集表达式
  Widget item; //单个item样式
  bool addAutomaticKeepAlives = true;
  bool addRepaintBoundaries = true;
  bool addSemanticIndexes = true;
  double cacheExtent;
  ListViewParams(this.dataSetExp, this.item,
      {this.scrollDirection,
      this.reverse,
      this.shrinkWrap,
      this.padding,
      this.itemExtent,
      this.addAutomaticKeepAlives,
      this.addRepaintBoundaries,
      this.addSemanticIndexes,
      this.cacheExtent});
}
