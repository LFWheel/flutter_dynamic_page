import 'package:flutter/material.dart';
import 'dynamic_widget.dart';
import 'package:dynamic_client_test/utils.dart';
class ContainerWidgetParser extends WidgetParser {

  @override
  Widget parse(Map<String, dynamic> map) {
    Alignment alignment = parseAlignment(map['alignment']);
    Color color = parseHexColor(map['color']);
    BoxConstraints constraints = parseBoxConstraints(map['constraints']);
    //TODO: decoration, foregroundDecoration and transform properties to be implemented.
    EdgeInsetsGeometry margin = parseEdgeInsetsGeometry(map['margin']);
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    Map<String, dynamic> childMap = map['child'];
    Widget child = null;
    if(null!=childMap){
      DynamicWidgetBuilder builder = new DynamicWidgetBuilder();
      builder.withData(data);
      child = builder.buildFromMap(childMap);
    }

    String clickEvent =
    map.containsKey("click_event") ? map['click_event'] : "";

    var containerWidget = Container(
      alignment: alignment,
      padding: padding,
      color: color,
      margin: margin,
      width: map['width'],
      height: map['height'],
      constraints: constraints,
      child: child,
    );
   return containerWidget;
    // if (listener != null && clickEvent!=null) {
    //   return GestureDetector(
    //     onTap: (){
    //       listener.onClicked(clickEvent);
    //     },
    //     child: containerWidget,
    //   );
    // }else {
    //   return containerWidget;
    // }
  }
}