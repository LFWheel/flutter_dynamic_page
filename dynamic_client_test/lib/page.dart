
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_delegate/list_view_delegate.dart';
class PageExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //DynamicWidgetBuilder();
    return new Container(
      child: new ListViewDelegateWidget(
        new ListViewParams(
          "data.goods", 
          new Container(
            child: new Text("data.name"),
          ),
          )
      )
    );
  }

}