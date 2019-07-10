import 'package:analyzer/dart/ast/ast.dart';

import '../base_parser.dart';

class TextStyleParser extends BaseParser {
  @override
  parse(Expression exp) {
    if (exp is InstanceCreationExpression) {
      Map<String, dynamic> info = new Map();
      exp.argumentList.arguments.forEach((arg) {
        NamedExpression namedExp = arg;
        buildStyleInfo(namedExp, info);
      });
      return info;
    }
    return null;
  }
  void buildStyleInfo(NamedExpression exp, Map<String, dynamic> info) {
    String label = exp.name.label.toSource();
    Expression valueExp = exp.expression;
    if('fontSize' == label){
      if(valueExp is IntegerLiteral){
        info[label] = valueExp.value.toDouble();
      }else if(valueExp is DoubleLiteral){
        info[label] = valueExp.value;
      }
    }else if('fontStyle' == label || 'fontWeight' == label){
      info[label] = parsePrefixedIdentifier(valueExp);
    }else if('color' == label){
      info[label] = parseColor(valueExp);
    }
  }

  String parsePrefixedIdentifier(Expression exp){
    if(exp is PrefixedIdentifier){
      PrefixedIdentifier valueExp = exp;
      return valueExp.identifier.toSource();
    }
    return null;
  }

  String parseColor(Expression exp){
    if(exp is InstanceCreationExpression){
      if('Color' == exp.constructorName.toSource()){
        Expression colorValueExp = exp.argumentList.arguments[0];
        if(colorValueExp is IntegerLiteral){
          return colorValueExp.toSource().substring(2);//remove 0x
        }
      }
    }
    print("Text控件的color属性赋值不规范，请使用new关键字");
    return null;
  }
}