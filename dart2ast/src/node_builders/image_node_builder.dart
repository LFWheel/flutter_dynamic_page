import 'package:analyzer/dart/ast/ast.dart';

import '../property_parsers/double_value_parser.dart';
import '../property_parsers/enum_value_parser.dart';
import 'base_node_builder.dart';
//TODO:暂不支持memory,file
class ImageNodeBuilder extends BaseNodeBuilder{
  @override
  Map<String, dynamic> buildNode(InstanceCreationExpression insc) {
    String constructName = insc.constructorName.toSource();
    Map<String,dynamic> imageInfo = {};
    imageInfo['type'] = "Image";
    if('Image.network' == constructName){
      imageInfo['provider'] = 'network';
    }else if('Image.asset' == constructName){
      imageInfo['provider'] = 'asset';
    }
    NodeList<Expression> exps = insc.argumentList.arguments;
    for(Expression exp in exps){
      if(exp is SimpleStringLiteral){
        imageInfo['src'] = exp.value;
      }else if(exp is NamedExpression){
        String label = exp.name.label.toSource();
        if('width' == label || 'height' == label){
          imageInfo[label] = DoubleValueParser().parse(exp.expression);
        }else if('fit' == label || 'alignment' == label || 'repeat' == label){
          imageInfo[label] = EnumValueParser().parse(exp.expression);
        }
      }
    }
    return imageInfo;
  }

}