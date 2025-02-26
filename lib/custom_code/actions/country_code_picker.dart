// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:country_picker/country_picker.dart';

Future<String> countryCodePicker(BuildContext context) async {
  String returnValue2 = "";
  String returnValue = "";
  showCountryPicker(
    context: context,
    showPhoneCode: true,
    onSelect: (Country country) {
      returnValue = country?.displayName ?? "";
    },
  );

  return returnValue;
}
