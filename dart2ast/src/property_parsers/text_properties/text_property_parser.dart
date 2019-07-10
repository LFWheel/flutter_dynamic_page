import 'maxlines_parser.dart';
import 'semantics_label_parser.dart';
import 'softwrap_parser.dart';
import 'text_align_parser.dart';
import 'text_overflow_parser.dart';
import 'textdirection_parser.dart';
import 'text_style_parser.dart';
import 'textscalefactor_parser.dart';
import '../base_parser.dart';
class TextPropertyParser {
  static final _parsers = {
    'textAlign':TextAlignmentParser(),
    'overflow':TextOverflowParser(),
    'maxLines':MaxLinesParser(),
    'semanticsLabel':SemanticsLabelParser(),
    'softWrap':SoftWrapParser(),
    'textDirection':TextDirectionParser(),
    'style':TextStyleParser(),
    'textScaleFactor':TextScaleFactorParser()
  };
  static BaseParser getParser(String name) {
    BaseParser parser = _parsers[name];
    if (null == parser) {
      print("No Propertyparser support for type:" + name);
    }
    return parser;
  }
}