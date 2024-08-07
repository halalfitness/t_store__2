import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/images/circular_image.dart';
import 'package:t_store/common/widgets/text/section_header.dart';
import 'package:t_store/constants/colors.dart';
import 'package:t_store/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final UserController controller = Get.put(UserController());

    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title:
            Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: dark ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: "Account Settings",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                onPressed: () {},
                title: "Name",
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: "E-mail",
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: "Phone number",
                value: controller.user.value.phoneNumber,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: "Fitness Settings",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                onPressed: () {},
                title: "Preferred Workout Time",
                value: "Morning",
              ),
              TProfileMenu(
                onPressed: () {},
                title: "Workout Reminders",
                value: "Enabled",
                icon: Iconsax.notification,
              ),
              TProfileMenu(
                onPressed: () {},
                title: "Daily Step Goal",
                value: "10,000 steps",
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
