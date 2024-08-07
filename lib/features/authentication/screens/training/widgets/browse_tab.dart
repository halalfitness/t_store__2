import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

class BrowseTab extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(controller.user.value.email)),
    );
  }
}
