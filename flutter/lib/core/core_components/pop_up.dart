import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoader() => showDialog(
    context: Get.context!,
    builder: (_) =>
        const PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
);

void showSnackBar(String label) => ScaffoldMessenger.of(Get.context!).
showSnackBar(SnackBar(
  content: Text(label),
));