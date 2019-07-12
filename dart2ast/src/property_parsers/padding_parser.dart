import 'package:analyzer/dart/ast/ast.dart';
import 'base_parser.dart';
class Paddingparser extends BaseParser{
  
  @override
  parse(Expression exp) {
    if(exp is InstanceCreationExpression){
      print("parse padding");
      print(exp.constructorName?.toSource());
      String paddings = '';
      if('EdgeInsets.fromLTRB' == exp.constructorName?.toSource()){
        exp.argumentList.arguments.forEach((arg){
          paddings = paddings+arg.toSource()+',';
        });
        paddings = paddings.substring(0,paddings.length-1);
        return paddings;
      }else{
        print("padding,margin只支持EdgeInsets.fromLTRB构造");
        return "0,0,0,0";
      }
    }else{
      print("padding属性未使用const或new赋值");
      return null;
    }
  }
  
}