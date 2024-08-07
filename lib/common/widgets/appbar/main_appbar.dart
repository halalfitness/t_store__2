import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color iconColor;

  const TAppBar({
    required this.scaffoldKey,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      title: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'dopa',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: dark
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Colors.black,
                      ),
                ),
                TextSpan(
                  text: 'Mine',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: const Color(0xff4caf50),
                      ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/content/download.png",
            color: Colors.green,
            height: 55, // Adjust the height to fit the AppBar
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: dark ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu, color: iconColor),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
