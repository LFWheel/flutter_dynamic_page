import 'package:analyzer/dart/ast/ast.dart';
import 'base_parser.dart';
class Paddingparser extends BaseParser{
  
  @override
  parse(Expression exp) {
    if(exp is InstanceCreationExpression){
      print("parse padding");
      print(exp.constructorName?.toSource());
      List paddings = [];
      if('EdgeInsets.fromLTRB' == exp.constructorName?.toSource()){
        exp.argumentList.arguments.forEach((arg){
          paddings.add(arg.toSource());
        });
      }
      return paddings;
    }else{
      print("padding属性未使用const或new赋值");
      return null;
    }
  }
  
}