
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';
import 'package:flutter_health_code_challenge/constant/constants.dart';
import 'package:flutter_health_code_challenge/data/remote/http_methods/http_common_method.dart';
import 'package:flutter_health_code_challenge/util/util.dart';

class HomeRepository{

  Future<HomeModelEntity> getHomeList() async {
    return HomeModelEntity.fromJson(await returnResponse( await getApi("${ApiEndPoints.home}${ApiEndPoints.country}category=${ApiEndPoints.category}&apiKey=${ApiEndPoints.apiKey}")));
  }

}