import 'package:analyzer/dart/ast/ast.dart';

import 'base_parser.dart';

class EnumValueParser extends BaseParser{
  @override
  parse(Expression exp) {
    if (exp is PrefixedIdentifier) {
      PrefixedIdentifier valueExp = exp;
      return valueExp.identifier.toSource();
    }
    return null;
  }

}