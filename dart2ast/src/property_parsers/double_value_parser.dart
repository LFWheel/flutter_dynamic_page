import 'package:analyzer/dart/ast/ast.dart';

import 'base_parser.dart';

class DoubleValueParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is IntegerLiteral){
        return exp.value.toDouble();
      }else if(exp is DoubleLiteral){
        return exp.value;
      }
    return null;
  }

}