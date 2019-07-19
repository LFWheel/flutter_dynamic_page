import 'package:analyzer/dart/ast/ast.dart';

import '../property_parsers/enum_value_parser.dart';
import 'base_node_builder.dart';
import 'widget_node_builder.dart';

class ColumnRowNodeBuilder extends BaseNodeBuilder{
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String,dynamic> columnInfo = {};
    columnInfo['type'] = insc.constructorName.toSource();
    NodeList<Expression> argExps = insc.argumentList.arguments;
    for(Expression exp in argExps){
      if(exp is NamedExpression){
        String label = exp.name.label.toSource();
        if('children' == label){
          ListLiteral listLiteral =  exp.expression;
          NodeList<CollectionElement> elements = listLiteral.elements;
          List<Map<String,dynamic>> children = [];
          for(var e in elements){
            if(e is InstanceCreationExpression){
              String childConstructName = e.constructorName.toSource();
              children.add(WidgetNodeBuilder.getNodeBuilder(childConstructName).buildNode(e));
            }else{
              print("Column,Row的子组件未使用new或者const构造");
            }
          }
          columnInfo['children'] = children;
        }else{
          //其他属性都是enum类型
          columnInfo[label] = EnumValueParser().parse(exp.expression);
        }
      }
    }
    return columnInfo;
  }

}