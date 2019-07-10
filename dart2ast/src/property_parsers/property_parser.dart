import 'base_parser.dart';
import 'color_parser.dart';
import 'double_value_parser.dart';
import 'padding_parser.dart';
import 'alignment_parser.dart';
import 'package:analyzer/analyzer.dart';

class PropertyParser {
  static final Map<String, BaseParser> _parsers = {
    'padding': Paddingparser(),
    'margin':Paddingparser(),
    'alignment': AlignmentParser(),
    'color':ColorParser(),
    'height':DoubleValueParser(),
    'width':DoubleValueParser()
  };
  static BaseParser getParser(String name) {
    BaseParser parser = _parsers[name];
    if (null == parser) {
      print("No Propertyparser support for type:" + name);
    }
    return parser;
  }
}
