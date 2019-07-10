import 'package:analyzer/dart/ast/ast.dart';

import 'base_parser.dart';

class ColorParser extends BaseParser {
  @override
  parse(Expression exp) {
    if (exp is InstanceCreationExpression) {
      if ('Color' == exp.constructorName.toSource()) {
        Expression colorValueExp = exp.argumentList.arguments[0];
        if (colorValueExp is IntegerLiteral) {
          return colorValueExp.toSource().substring(2); //remove 0x
        }
      }
    }
    print("Text控件的color属性赋值不规范，请使用new关键字");
    return null;
  }
}
