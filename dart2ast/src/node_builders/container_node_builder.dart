import 'package:analyzer/analyzer.dart';
import '../property_parsers/decoration_parser.dart';
import '../property_parsers/property_parser.dart';
import 'base_node_builder.dart';
import 'widget_node_builder.dart';
class ContainerNodeBuilder extends BaseNodeBuilder{
  //todo:support decoration..property
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String,dynamic> nodeInfoMap = new Map();
    NodeList<Expression> argsExps = insc.argumentList.arguments;
    nodeInfoMap['type'] = 'Container';
    for(Expression exp in argsExps){
      if(exp is NamedExpression){
        String label = exp.name.label.toSource();
        if('child' == label){
          if(exp.expression is InstanceCreationExpression){
            InstanceCreationExpression inExp = exp.expression;
            String type = inExp.constructorName.toSource();
            nodeInfoMap['child'] = WidgetNodeBuilder.getNodeBuilder(type)?.buildNode(inExp);
          }else{
            print("Container child属性未使用const或new赋值");
          }
        }else if('decoration' == label){
          nodeInfoMap[label] = DecorationParser().parse(exp.expression);
        }else{
          String propertyName = exp.name.label.toSource();
          nodeInfoMap[propertyName] = PropertyParser.getParser(propertyName)?.parse(exp.expression);
        }
      }
    }
    if(nodeInfoMap['color']!=null && nodeInfoMap['decoration']!=null){
      throw new Exception("Container的color属性不能与decoration属性同时指定");
    }
    return nodeInfoMap;
  }


}