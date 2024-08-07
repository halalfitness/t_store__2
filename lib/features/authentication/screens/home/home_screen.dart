import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/buttons/rounded_text_button.dart';
import 'package:t_store/common/widgets/text/grey_text.dart';
import 'package:t_store/features/authentication/screens/home/widgets/carosal_item.dart';
import 'package:t_store/features/authentication/screens/home/widgets/carosal_slider.dart';
import 'package:t_store/features/authentication/screens/memberships/memberships.dart';
import 'package:t_store/features/authentication/screens/training/training.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: isDarkMode ? TColors.black : TColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add_alt_1,
                color: isDarkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : TColors.black),
            onPressed: () {
              // Handle user icon button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TGreyText(
                text:
                    "What's New, ${controller.user.value.firstName} ?\nCheck out the latest from Training!",
              ),
            ),
            CustomCarouselSlider(
              carouselItems: [
                CarouselItem(
                  imagePath: TImages.homeimage2,
                  title: 'Get Fit Now',
                  subtitle: 'JOIN THE FITNESS\nREVOLUTION',
                  buttonText: 'Join Now',
                  onButtonPressed: () {
                    // Handle button press
                  },
                ),
                CarouselItem(
                    imagePath: TImages.homeimage1,
                    title: 'Athlete-inspired workouts',
                    subtitle: 'TRAIN LIKE YOUR\nFAVE ATHLETE',
                    buttonText: 'Move With Us',
                    onButtonPressed: () => Get.put(() => const Training())),
                CarouselItem(
                  imagePath:
                      TImages.homeimage3, // Add the path to your new image here
                  title: 'Stay Motivated',
                  subtitle: 'KEEP PUSHING\nYOUR LIMITS',

                  buttonText: 'Start Now',
                  onButtonPressed: () => Get.to(() => const Memberships()),
                ),
              ],
            ),
            TRoundedTextButton(
              text: "View All",
              onPressed: () {},
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/content/download.png",
                    color: Colors.green,
                    height: 150,
                  ),
                  const TGreyText(
                    text: "Looking for dopaMine?\nLet's do a workout!",
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    height: 60,
                    width: 210,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? TColors.lightGrey : TColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                      ),
                      onPressed: () => Get.to(() => const Training()),
                      focusNode:
                          FocusNode(skipTraversal: true), // Remove blue outline
                      child: Text(
                        'Explore Workouts',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                              color: isDarkMode
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : TColors.white,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
