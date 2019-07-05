import 'package:analyzer/analyzer.dart';
import '../property_parsers/property_parser.dart';
import 'base_node_builder.dart';
import 'widget_node_builder.dart';
class ContainerNodeBuilder extends BaseNodeBuilder{
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String,dynamic> nodeInfoMap = new Map();
    NodeList<Expression> argsExps = insc.argumentList.arguments;
    nodeInfoMap['type'] = 'Container';
    for(Expression exp in argsExps){
      if(exp is NamedExpression){
        if('child' == exp.name.label.toSource()){
          if(exp.expression is InstanceCreationExpression){
            InstanceCreationExpression inExp = exp.expression;
            String type = inExp.constructorName.toSource();
            nodeInfoMap['child'] = WidgetNodeBuilder.getNodeBuilder(type).buildNode(inExp);
          }else{
            print("Container child属性未使用const或new赋值");
          }
        }else{
          String propertyName = exp.name.label.toSource();
          nodeInfoMap[propertyName] = PropertyParser.getParser(propertyName)?.parse(exp.expression);
        }
      }
    }
    return nodeInfoMap;
  }


}