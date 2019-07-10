import '../base_parser.dart';
import 'package:analyzer/analyzer.dart';

class TextAlignmentParser extends BaseParser {
  @override
  parse(Expression exp) {
    if (exp is PrefixedIdentifier) {
      PrefixedIdentifier pexp = exp;
      return pexp.identifier.toSource();
    }
    print("alignment属性赋值不规范");
    return null;
  }
}
