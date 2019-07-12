import 'base_node_builder.dart';
import 'container_node_builder.dart';
import 'text_node_builder.dart';
import 'list_view_node_builder.dart';
class WidgetNodeBuilder{
  static final Map<String,BaseNodeBuilder> _nodeBuilders = {
    'Container':ContainerNodeBuilder(),
    'Text': TextNodeBuilder(),
    'ListViewDelegateWidget':ListViewNodeNuilder()
  };

  static BaseNodeBuilder getNodeBuilder(String type){
    BaseNodeBuilder nodeBuilder = _nodeBuilders[type];
    if(nodeBuilder == null){
      print("未定义类型为{$type} Widget的node builder");
    }
    return nodeBuilder;
  }
}