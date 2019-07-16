import 'package:flutter/material.dart';
class TapGestureDelegate extends StatelessWidget{
  final Widget child;
  final TapActionInfo tapAction;
  TapGestureDelegate(this.child,this.tapAction);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ,
    );
  }
}
class TapEventManager{
  static final Map<String,TapEventHandler> _eventHandlers = {
    'OpenUrl':OpenUrlTapEventHandler(),
  };
  static TapEventHandler getEventHandler(String actionId){
    return _eventHandlers[actionId];
  }
}
abstract class TapEventHandler{
  void handleEvent(String data);
}
class OpenUrlTapEventHandler extends TapEventHandler{
  @override
  void handleEvent(String data) {
    // TODO: implement handleEvent
  }

}
class TapActionInfo{
  String action;
  String data;
}



