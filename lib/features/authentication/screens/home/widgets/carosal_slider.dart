import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_store/constants/colors.dart';
import 'package:t_store/features/authentication/screens/home/widgets/carosal_item.dart';
import 'package:t_store/features/authentication/screens/training/training.dart';
import 'package:t_store/utils/helpers/helper_functions.dart'; // Import Training screen

class CustomCarouselSlider extends StatefulWidget {
  final List<CarouselItem> carouselItems;

  const CustomCarouselSlider({
    super.key,
    required this.carouselItems,
  });

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 8),
            enlargeCenterPage: false, // Set to false for uniform size
            aspectRatio: 16 / 9,
            viewportFraction: 1.0, // Ensures no gap between images
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to Training screen
                    Get.to(() => const Training());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.zero,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 19.0),
                              Text(
                                item.subtitle,
                                style: GoogleFonts.bebasNeue(
                                  height: 1,
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          255, 247, 245, 245),
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              SizedBox(
                                width: 130,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: isDarkMode
                                        ? Colors.green
                                        : Colors.green,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: TColors.black),
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                  ),
                                  onPressed: () =>
                                      Get.to(() => const Training()),
                                  child: Text(
                                    item.buttonText,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.carouselItems.length,
              (index) => Container(
                height: 4.0,
                width: _currentIndex == index ? 20.0 : 10.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
