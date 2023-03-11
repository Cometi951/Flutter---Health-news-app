
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';
import 'package:flutter_health_code_challenge/constant/constants.dart';
import 'package:flutter_health_code_challenge/data/remote/http_methods/http_common_method.dart';
import 'package:flutter_health_code_challenge/util/util.dart';

class MockHomeRepository{

  Future<HomeModelEntity> getHomeList() async {
    final String response = await rootBundle.loadString('test/mockData.json');
    final data = await json.decode(response);
    return HomeModelEntity.fromJson(data);
  }

}