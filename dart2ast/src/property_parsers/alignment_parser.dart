import 'base_parser.dart';
import 'package:analyzer/analyzer.dart';
class AlignmentParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is PrefixedIdentifier){
      PrefixedIdentifier pexp = exp;
      return exp.identifier.toSource();
    }else{
      print("alignment属性赋值不规范");
      return null;
    }
  }

}