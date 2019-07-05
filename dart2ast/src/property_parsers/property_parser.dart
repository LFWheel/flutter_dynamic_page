import 'base_parser.dart';
import 'padding_parser.dart';
import 'alignment_parser.dart';
class PropertyParser{
  static final Map<String,BaseParser> _parsers = {
    'padding': Paddingparser(),
    'alignment': AlignmentParser()
  };
  static BaseParser getParser(String name){
    BaseParser parser = _parsers[name];
    if(null == parser){
      print("No Propertyparser support for type:"+name);
    }
    return parser;
  }
}