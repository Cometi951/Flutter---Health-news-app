import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../constant/constants.dart';
import '../../../util/util.dart';

Future<http.Response> getApi(String url) async {
  if (await isInternetAvailable()) {
    try {
      if (kDebugMode) {
        log("get api request is :- ${Uri.parse(ApiEndPoints.baseUrl + url)}");
      }
      var response = await http.Client().get(Uri.parse(ApiEndPoints.baseUrl + url));
      if (kDebugMode && (response.statusCode >= 200 && response.statusCode <= 299)) {
        log("get api response is :- ${const JsonEncoder.withIndent('  ').convert(json.decode(response.body))}");
      }
      return response;
    } on SocketException catch (e) {
      if (kDebugMode) {
        log("get api response error ${e.message}");
      }
      throw "Something Went Wrong";
    }
  } else {
    throw "No internet available";
  }
}
