// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginationWidget extends StatefulWidget {
  const PaginationWidget({
    super.key,
    this.width,
    this.height,
    required this.listView,
  });

  final double? width;
  final double? height;
  final Widget Function() listView;

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: refreshController,
      onRefresh: () {},
      onLoading: () {},
      child: Container(),
    );
  }
}
