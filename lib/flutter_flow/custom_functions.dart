import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String getTimeAgo(String apiTime) {
  DateTime parsedDateTime = DateTime.parse(apiTime);
  Duration duration = DateTime.now().toUtc().difference(parsedDateTime.toUtc());

  if (duration.inDays >= 365) {
    int years = (duration.inDays / 365).floor();
    return '$years ${years == 1 ? "year" : "years"} ago';
  } else if (duration.inDays >= 30) {
    int months = (duration.inDays / 30).floor();
    return '$months ${months == 1 ? "month" : "months"} ago';
  } else if (duration.inDays >= 7) {
    int weeks = (duration.inDays / 7).floor();
    return '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
  } else if (duration.inDays >= 1) {
    return '${duration.inDays} ${duration.inDays == 1 ? "day" : "days"} ago';
  } else if (duration.inHours >= 1) {
    return '${duration.inHours} ${duration.inHours == 1 ? "hour" : "hours"} ago';
  } else if (duration.inMinutes >= 1) {
    return '${duration.inMinutes} ${duration.inMinutes == 1 ? "minute" : "minutes"} ago';
  } else if (duration.inSeconds >= 1) {
    return '${duration.inSeconds} ${duration.inSeconds == 1 ? "second" : "seconds"} ago';
  } else {
    return 'just now';
  }
}

String primaryDateFormate(
  String apiTime,
  String dateFormat,
) {
  final DateFormat formatter = DateFormat(dateFormat);

  if (apiTime != null) {
    final String formatted =
        formatter.format(DateTime.parse(apiTime).toLocal());
    return formatted;
  } else {
    return "";
  }
}

int getUpdatedBookmarkFunction(
  int index,
  dynamic forSaleJson,
  String type,
) {
  if (type == "item") {
    return forSaleJson['item_list'][index]['is_bookmarked'];
  } else {
    return forSaleJson['service_list'][index]['is_bookmarked'];
  }
}
