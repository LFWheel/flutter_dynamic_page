import 'package:analyzer/dart/ast/ast.dart';

import '../base_parser.dart';
import '../color_parser.dart';
import '../double_value_parser.dart';

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
    if ('fontSize' == label) {
      info[label] = DoubleValueParser().parse(valueExp);
    } else if ('fontStyle' == label || 'fontWeight' == label) {
      info[label] = parsePrefixedIdentifier(valueExp);
    } else if ('color' == label) {
      info[label] = ColorParser().parse(valueExp);
    }
  }

  String parsePrefixedIdentifier(Expression exp) {
    if (exp is PrefixedIdentifier) {
      PrefixedIdentifier valueExp = exp;
      return valueExp.identifier.toSource();
    }
    return null;
  }
}
