import 'package:analyzer/dart/ast/ast.dart';

import 'base_node_builder.dart';
import 'widget_node_builder.dart';

class ListViewNodeNuilder extends BaseNodeBuilder{
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    Map<String,dynamic> lvInfo = {};
    String constructName = insc.constructorName.toSource();
    if('ListViewDelegateWidget' == constructName){
      lvInfo['type'] = 'ListView';
      Expression paramsExp = insc.argumentList.arguments[0];
      if(paramsExp is InstanceCreationExpression){
        String paramConstructName = paramsExp.constructorName.toSource();
        if('ListViewParams'==paramConstructName){
          NodeList<Expression> argExps = paramsExp.argumentList.arguments;
          for(Expression argExp in argExps){
            if(argExp is SimpleStringLiteral){
              lvInfo['dataSetExp'] = argExp.value;
            }else if(argExp is InstanceCreationExpression){
              lvInfo['item'] = WidgetNodeBuilder.getNodeBuilder(argExp.constructorName.toSource()).buildNode(argExp);
            }
          }
        }
      }
    }
    return lvInfo;
  }

}