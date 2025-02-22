// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> updateItemBookmarkStatusKeyValue(
  dynamic forSaleJson,
  int index,
  String type,
) async {
  if (type == "item") {
    forSaleJson['item_list'][index]['is_bookmarked'] =
        (forSaleJson['item_list'][index]['is_bookmarked'] == 1 ? 0 : 1);
    return forSaleJson;
  } else {
    forSaleJson['service_list'][index]['is_bookmarked'] =
        (forSaleJson['service_list'][index]['is_bookmarked'] == 1 ? 0 : 1);
    return forSaleJson;
  }
}
