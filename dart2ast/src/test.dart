import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:analyzer/src/generated/scanner.dart';
import 'dart:io';
import 'dart:convert';
import './node_builders/container_node_builder.dart';
import 'node_builders/widget_node_builder.dart';

//code to parse
String src2 = r"""
import 'package:flutter/material.dart';

class FollowedTopicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: new InkWell(
        child: new Center(
          child: const Text('Plugin example app'),
        ),
        onTap: () {},
      ),
    );
  }
}
""";
String src3 = r"""
Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: const Text(
        "data.text.titles[0]",
        style: new TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: new Color(0xffef6666)
      )
        )
    );
  }
""";
main(List<String> arguments) async {
  if (null != arguments && arguments.length > 0) {
    String path = arguments[0];
    var src = await new File(path).readAsString();
    var ast = parseCompilationUnit(src, parseFunctionBodies: true);
    var nodes = flatten_tree(ast);
    for (var node in nodes) {
      if (node is InstanceCreationExpression) {
        Map<String, dynamic> nodeMap = WidgetNodeBuilder.getNodeBuilder(node.constructorName.toSource()).buildNode(node);
        print(jsonEncode(nodeMap));
        break;
      }
    }
  };
}

List flatten_tree(AstNode n, [int depth = 9999999]) {
  var que = [];
  que.add(n);
  var nodes = [];
  int nodes_count = que.length;
  int dep = 0;
  int c = 0;
  if (depth == 0) return [n];
  while (que.isNotEmpty) {
    var node = que.removeAt(0);
    if (node is! AstNode) continue;
    for (var cn in node.childEntities) {
      nodes.add(cn);
      que.add(cn);
    }
    //Keeping track of how deep in the tree
    ++c;
    if (c == nodes_count) {
      ++dep; // One layer done
      if (depth <= dep) return nodes;
      c = 0;
      nodes_count = que.length;
    }
  }
  return nodes;
}
show(node) {
  print('Type: ${node.runtimeType}, body: $node');
}
