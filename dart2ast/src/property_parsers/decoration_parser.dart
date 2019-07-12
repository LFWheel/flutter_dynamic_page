import 'package:analyzer/dart/ast/ast.dart';

import 'base_parser.dart';
import 'color_parser.dart';
import 'double_value_parser.dart';
import 'enum_value_parser.dart';
//暂不支持image,shadow,gradient,backgroundBlendMode属性
class DecorationParser extends BaseParser{
  @override
  parse(Expression exp) {
    print("DecorationParser:"+exp.runtimeType.toString());
    if(exp is InstanceCreationExpression){
      Map<String,dynamic> decoInfo = new Map();
      NodeList<Expression> argExps = exp.argumentList.arguments;
      for(Expression argExp in argExps){
        if(argExp is NamedExpression){
          String label = argExp.name.label.toSource();
          if('color' == label){
            decoInfo[label] = ColorParser().parse(argExp.expression);
          }else if('border' == label){
            decoInfo[label] = BorderParser().parse(argExp.expression);
          }else if('borderRadius' == label){
            decoInfo[label] = BorderRadiusParser().parse(argExp.expression);
          }else if('shape' == label){
            decoInfo[label] = EnumValueParser().parse(argExp.expression);
          }
        }
      }
      return decoInfo;
    }
    print("decoration属性未使用new或const关键字赋值");
    return null;
  }

}

/**
 * border: new Border(
          top: new BorderSide(
            color: new Color(0xff),
            width: 2.0,
            style: BorderStyle.solid
          )
          ),
 */
class BorderParser extends BaseParser{
  @override
  parse(Expression exp) {
    print("BorderParser"+exp.runtimeType.toString());
    if(exp is InstanceCreationExpression){
      NodeList<Expression> argExps = exp.argumentList.arguments;
      Map<String,dynamic> borderInfo = new Map();
      BorderSideParser borderSideParser = new BorderSideParser();
      for(Expression argExp in argExps){
        if(argExp is NamedExpression){
          borderInfo[argExp.name.label.toSource()] = borderSideParser.parse(argExp.expression);
        }
      }
      return borderInfo;
    }
    print("border属性未使用new关键字赋值");
    return null;
  }
}

class BorderSideParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is InstanceCreationExpression){
      NodeList<Expression> argExps = exp.argumentList.arguments;
      Map<String,dynamic> borderSideInfo = new Map();
      for(Expression argExp in argExps){
        if(argExp is NamedExpression){
          String label = argExp.name.label.toSource();
          if('color' == label){
            borderSideInfo[label] = ColorParser().parse(argExp.expression);
          }else if('width' == label){
            borderSideInfo[label] = DoubleValueParser().parse(argExp.expression);
          }else if('style' == label){
            borderSideInfo[label] = EnumValueParser().parse(argExp.expression);
          }
        }
      }
      return borderSideInfo;
    }
    print("borderside属性未使用new关键字赋值");
    return null;
  }
}

//只支持const BorderRadius.only
class BorderRadiusParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is InstanceCreationExpression){
      String constructName = exp.constructorName.toSource();
      if('BorderRadius.only' == constructName){
        NodeList<Expression> argExps = exp.argumentList.arguments;
        Map<String,dynamic> borderRadiusInfo = {};
        RadiusParser radiusParser = new RadiusParser();
        for(Expression argExp in argExps){
          if(argExp is NamedExpression){
            String label = argExp.name.label.toSource();
            borderRadiusInfo[label] = radiusParser.parse(argExp.expression);
          }
        }
        return borderRadiusInfo;
      }else{
        print("borderRadius属性只支持BorderRadius.only构造");
      }
    }
    print("borderRadius属性未使用const赋值");
    return null;
  }
}

class RadiusParser extends BaseParser{
  @override
  parse(Expression exp) {
    if(exp is InstanceCreationExpression){
      String consName = exp.constructorName.toSource();
      if('Radius.circular' == consName){
        return DoubleValueParser().parse(exp.argumentList.arguments[0]);//只会有一个参数
      }else{
        print("Radius属性只支持Radius.circular构造");
      }
    }
    print("radius属性未使用const赋值");
    return null;
  }

}