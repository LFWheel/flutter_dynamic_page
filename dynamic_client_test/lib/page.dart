
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
class PageExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //DynamicWidgetBuilder();
    return new Container(
      color: new Color(0xffFFFF00),
      height: 200,
      width: 200,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: new Text(
        "testpagetestpagetestpagetestpage",
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 0.9,
        softWrap: false,
        maxLines: 1,
        semanticsLabel: 'www',
        style: new TextStyle(
          color: new Color(0xffefe6e6),
          fontWeight: FontWeight.bold,
          fontSize: 33
        ),
      ),
    );
  }

}