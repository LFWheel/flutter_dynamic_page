import 'package:analyzer/analyzer.dart';
abstract class BaseNodeBuilder{
  Map<String,dynamic> buildNode(InstanceCreationExpression insc);
}