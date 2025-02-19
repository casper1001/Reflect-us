
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/core/storage/storage_handler.dart';

class HomeMiddleware extends GetMiddleware {


  @override
  RouteSettings? redirect(String? route) {
    if(StorageHandler().hasToken){
      return const RouteSettings(name: '/Home');
    }
  }
}