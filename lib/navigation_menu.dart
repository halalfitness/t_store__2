import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/images/circular_image.dart';
import 'package:t_store/common/widgets/appbar/main_appbar.dart';
import 'package:t_store/constants/colors.dart';
import 'package:t_store/features/authentication/screens/home/home_screen.dart';
import 'package:t_store/features/authentication/screens/memberships/memberships.dart';
import 'package:t_store/features/authentication/screens/profile/profile.dart';
import 'package:t_store/features/authentication/screens/programmes/programmes.dart';
import 'package:t_store/features/authentication/screens/programmes/widgets/web_view.dart';
import 'package:t_store/features/authentication/screens/settings/settings.dart';
import 'package:t_store/features/authentication/screens/social/social.dart';
import 'package:t_store/features/authentication/screens/training/training.dart';
import 'package:t_store/features/authentication/screens/inbox/inbox.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    final dark = THelperFunctions.isDarkMode(context);
    final NavigationController navigationController =
        Get.put(NavigationController());
    final iconColor =
        dark ? const Color.fromARGB(255, 255, 255, 255) : TColors.black;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:
          dark ? Colors.black : const Color.fromARGB(255, 255, 255, 255),
      appBar: TAppBar(
        scaffoldKey: _scaffoldKey,
        iconColor: iconColor,
      ),
      body: Column(
        children: [
          Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Obx(() => navigationController
                .screens[navigationController.selectedIndex.value]),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: dark ? Colors.black : Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: UserAccountsDrawerHeader(
                accountName: Obx(() {
                  return Text(
                    controller.user.value.fullName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                }),
                accountEmail: Obx(() {
                  return Text(
                    controller.user.value.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                currentAccountPicture: TCircularImage(
                  isNetworkImage: true,
                  image: controller.user.value.profilePicture,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            buildListTile(context, navigationController, iconColor, Icons.timer,
                'Training', 0),
            buildListTile(context, navigationController, iconColor,
                Icons.assignment, 'Programmes', 1),
            buildListTile(context, navigationController, iconColor, Icons.home,
                'Home', 2),
            buildListTile(context, navigationController, iconColor,
                Icons.people, 'Social', 3),
            buildListTile(
                context,
                navigationController,
                iconColor,
                Icons.accessibility,
                'Memberships',
                4), // Add Membership ListTile
            buildListTile(context, navigationController, iconColor,
                Icons.bar_chart, 'Activity', 5),
            buildListTile(context, navigationController, iconColor, Icons.inbox,
                'Inbox', 6),
            const Divider(),
            buildListTile(context, navigationController, iconColor,
                Icons.settings, 'Settings', 7),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, NavigationController controller,
      Color iconColor, IconData icon, String title, int index) {
    return ListTile(
      leading: Obx(() => Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? iconColor
                : Colors.grey,
          )),
      title: Obx(() => Text(
            title,
            style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? iconColor
                  : Colors.grey,
            ),
          )),
      onTap: () {
        controller.selectedIndex.value = index;
        Navigator.pop(context);
      },
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;
  final screens = [
    const Training(),
    ProgrammesScreen(),
    const Home(),
    const Social(),
    const Memberships(),

    Container(), // Placeholder for Activity screen
    NotificationInboxScreen(), // Placeholder for Inbox screen
    const SettingsScreen(), // Placeholder for Settings screen
  ];
}
