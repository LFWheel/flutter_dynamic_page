import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ListViewWidgetParser extends WidgetParser{
  @override
  Widget parse(Map<String, dynamic> map) {
    String dataSetExp = map['dataSetExp'];
    List data = parseData(dataSetExp);
    return new ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx,i){
        DynamicWidgetBuilder builder =  DynamicWidgetBuilder();
        builder.withData(data[i]);
        return builder.buildFromMap(map['item']);
      },
    );
  }

}