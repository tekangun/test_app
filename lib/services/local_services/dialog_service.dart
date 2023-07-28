import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService {
  Future<void> showFullScreenLoadingDialog() async {
    return await showCupertinoModalPopup(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Stack(
              children: [
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                ),
              ],
            ),
          );
        });
  }
}
