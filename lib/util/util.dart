import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

  dynamic returnResponse( http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      try {
        switch (jsonDecode(response.body)["responseCode"]) {
          case 4101:
            return throw "Booking ";
          default:
            return jsonDecode(response.body);
        }
      } catch (e) {
        return jsonDecode(response.body);
      }
    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
      return throw jsonDecode(response.body)["msg"];
    } else if (response.statusCode >= 500 && response.statusCode <= 599) {
      return throw "Server Not Responding";
    } else {
      return throw response.body.toString();
    }
  }


Future<bool> isInternetAvailable() async {
  var internetConnection = await Connectivity().checkConnectivity();
  return !(internetConnection == ConnectivityResult.none);
}

void showSnackBar(BuildContext context, String text, [Color? bgColor]) {
  showTopSnackBar(displayDuration: const Duration(seconds: 1),
    safeAreaValues: const SafeAreaValues(
      minimum: EdgeInsets.only(top: 120),
    ),
    Overlay.of(context)!,
    bgColor != null ? CustomSnackBar.error(
      backgroundColor: bgColor,
      message: text,
    ) : CustomSnackBar.success(
      message: text,
    ),
  );
}