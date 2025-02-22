// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceUniqueId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String deviceId;

  try {
    if (kIsWeb) {
      // Web does not provide a unique device ID, so you can return a placeholder or generate a UUID
      deviceId = 'WebDeviceID'; // Or use a generated UUID for web if needed
    } else {
      if (defaultTargetPlatform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.id ?? ''; // Return Android ID directly
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? ''; // Return iOS ID directly
      } else {
        deviceId = ''; // Handle unsupported platforms like macOS, Windows, etc.
      }
    }
  } on PlatformException {
    deviceId = ''; // In case of a PlatformException
  }

  return deviceId;
}
