import 'dart:io';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_delegate/list_view_delegate.dart';

class PageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DynamicWidgetBuilder();
    return new Container(
      child: new ListViewDelegateWidget(
        new ListViewParams(
          'data.goods',
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Image.network("data.img",width:90,height:90,fit:BoxFit.fill),
              new Column(
                children: <Widget>[
                  new Text("data.name"),
                  new Text("data.price")
                ],
              )
            ],
          )
        )
      )
      );
  }
}
