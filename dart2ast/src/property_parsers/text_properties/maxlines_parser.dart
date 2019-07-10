import 'package:analyzer/dart/ast/ast.dart';

import '../base_parser.dart';

class MaxLinesParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is IntegerLiteral){
      return exp.value;
    }
    return null;
  }

}