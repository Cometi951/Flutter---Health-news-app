import 'package:flutter/material.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';
import 'package:flutter_health_code_challenge/data/remote/response/ApiResponse.dart';
import '../repository/HomeRepository.dart';

class MockHomeNotifier {

  final homeRepo = MockHomeRepository();

  final ValueNotifier<ApiResponse<HomeModelEntity>> _homeList = ValueNotifier(ApiResponse.instance());
  ValueNotifier<ApiResponse<HomeModelEntity>> get homeList => _homeList;

  final ValueNotifier<bool> _isGridView = ValueNotifier(true);
  ValueNotifier<bool> get isGridView => _isGridView;


  Future getHomeList() async {
     _homeList.value = ApiResponse.loading();
     await homeRepo.getHomeList().then((value) {
       _homeList.value = ApiResponse.completed(value);
     }).onError((error, stackTrace) {
       _homeList.value = ApiResponse.error(error.toString());
     });
  }

  void changeView(bool viewType){
    _isGridView.value = viewType!;
  }
}