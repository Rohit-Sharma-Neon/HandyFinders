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

import 'package:readmore/readmore.dart';

class BaseReadMoreText extends StatefulWidget {
  const BaseReadMoreText({
    super.key,
    this.width,
    this.height,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<BaseReadMoreText> createState() => _BaseReadMoreTextState();
}

class _BaseReadMoreTextState extends State<BaseReadMoreText> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text,
      trimMode: TrimMode.Line,
      trimLines: 4,
      colorClickableText: Colors.blue,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Read Less',
      moreStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
    );
  }
}
