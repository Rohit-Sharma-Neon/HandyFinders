// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> updateLikeStatusKeyValue(
  dynamic indexedJson,
  bool isLiking,
) async {
  indexedJson['is_liked'] = isLiking ? 1 : 0;
  indexedJson['total_liked'] = isLiking
      ? indexedJson['total_liked'] + 1
      : indexedJson['total_liked'] - 1;
  return indexedJson;
}
