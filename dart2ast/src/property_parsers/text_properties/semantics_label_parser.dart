import 'package:analyzer/dart/ast/ast.dart';

import '../base_parser.dart';

class SemanticsLabelParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is SimpleStringLiteral){
      return exp.value;
    }
    return null;
  }

}