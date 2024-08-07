import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSubAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> tabs;
  final TabController tabController;
  final Color color;

  const TSubAppBar({
    super.key,
    required this.title,
    required this.tabs,
    required this.tabController,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: dark ? Colors.white : Colors.black),
      ),
      backgroundColor: dark ? TColors.black : TColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: dark ? Colors.white : Colors.black),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), // Height of TabBar
        child: Container(
          color: dark ? TColors.black : TColors.white,
          child: TabBar(
            controller: tabController,
            labelColor: dark ? color : color,
            unselectedLabelColor: dark ? Colors.grey : Colors.grey,
            indicatorColor: dark ? Colors.white : Colors.black,
            labelStyle:
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85.0);
}
