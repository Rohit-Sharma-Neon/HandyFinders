// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:lottie/lottie.dart';

Future showBaseLoader(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Lottie.network(
            width: 80,
            height: 80,
            "https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json",
          ),
        ),
      );
    },
  );
}
