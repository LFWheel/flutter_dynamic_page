
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
class PageExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //DynamicWidgetBuilder();
    return new Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(
            color: new Color(0xff),
            width: 2.0,
            style: BorderStyle.solid
          ),
          right: new BorderSide(
            color: new Color(0xff),
            width: 4.0,
            style: BorderStyle.none
          )
          ),
        color: new Color(0xff),
        shape: BoxShape.circle,
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(4),
          topRight: const Radius.circular(4.0),
        )
      ),
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