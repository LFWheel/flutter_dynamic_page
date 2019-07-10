import 'package:analyzer/dart/ast/ast.dart';
import '../property_parsers/text_properties/text_property_parser.dart';
import 'base_node_builder.dart';
class TextNodeBuilder extends BaseNodeBuilder {
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String, dynamic> nodeInfoMap = new Map();
    nodeInfoMap['type'] = 'Text';
    NodeList<Expression> argsExps = insc.argumentList.arguments;
    for (Expression exp in argsExps) {
      if (exp is SimpleStringLiteral) {
        nodeInfoMap['data'] = exp.value;
      } else if(exp is NamedExpression){
        String label = exp.name.label.toSource();
        nodeInfoMap[label] = TextPropertyParser.getParser(label)?.parse(exp.expression);
      }
    }
    return nodeInfoMap;
  }
}
