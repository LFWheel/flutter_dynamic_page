import 'package:flutter/material.dart';
class PageExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
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