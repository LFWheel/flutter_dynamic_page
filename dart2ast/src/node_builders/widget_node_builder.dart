import 'base_node_builder.dart';
import 'column_row_node_builder.dart';
import 'container_node_builder.dart';
import 'image_node_builder.dart';
import 'text_node_builder.dart';
import 'list_view_node_builder.dart';
class WidgetNodeBuilder{
  static final Map<String,BaseNodeBuilder> _nodeBuilders = {
    'Container':ContainerNodeBuilder(),
    'Text': TextNodeBuilder(),
    'Image.network':ImageNodeBuilder(),
    'Image.asset':ImageNodeBuilder(),
    'ListViewDelegateWidget':ListViewNodeNuilder(),
    'Column':ColumnRowNodeBuilder(),
    'Row':ColumnRowNodeBuilder(),
  };

  static BaseNodeBuilder getNodeBuilder(String type){
    BaseNodeBuilder nodeBuilder = _nodeBuilders[type];
    if(nodeBuilder == null){
      print("未定义类型为{$type} Widget的node builder");
    }
    return nodeBuilder;
  }
}