import 'package:analyzer/dart/ast/ast.dart';
import 'base_node_builder.dart';
class TextNodeBuilder extends BaseNodeBuilder{
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String,dynamic> nodeInfoMap = new Map();
    nodeInfoMap['type'] = 'Text';
    NodeList<Expression> argsExps = insc.argumentList.arguments;
    for(Expression exp in argsExps){
      if(exp is SimpleStringLiteral){
        nodeInfoMap['text'] = exp.value;
      }else{
        nodeInfoMap['text'] = exp.toSource();
      }
      print("TextNodeBuilder :"+exp.runtimeType.toString());
      print("TextNodeBuilder exp:"+exp.toSource());
    }
    return nodeInfoMap;
  }
}