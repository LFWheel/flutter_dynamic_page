import 'dart:io';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_delegate/list_view_delegate.dart';

class PageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DynamicWidgetBuilder();
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text('123'),
          new Text('456'),
          new Text('789')
        ],
      )
      );
  }
}
