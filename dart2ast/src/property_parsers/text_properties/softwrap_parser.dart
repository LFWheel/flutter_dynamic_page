import 'package:analyzer/dart/ast/ast.dart';

import '../base_parser.dart';

class SoftWrapParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is BooleanLiteral){
      return exp.value;
    }
    // TODO: implement parse
    return null;
  }

}