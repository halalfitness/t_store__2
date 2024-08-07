import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TrainerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Meet Our Trainers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Guiding you in all the ways you want to move',
              style: TextStyle(
                fontSize: 30, // Larger font size for subtitle
                color: dark
                    ? Colors.grey
                    : Colors.grey[350], // Lighter color for subtitle
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50), // Adjusted padding after subtitle

            // Ensure the GridView fits within the remaining height
            Container(
              height: mediaQueryHeight -
                  250, // Adjust height to fit remaining space
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 120, // Adjust spacing
                ),
                itemCount: 10, // Number of trainers
                itemBuilder: (context, index) {
                  // Dummy trainer names and subtitles
                  List<String> names = [
                    'John Doe',
                    'Jane Smith',
                    'Michael Brown',
                    'Emily Davis',
                    'Chris Johnson',
                    'Katie Wilson',
                    'Ryan Lee',
                    'Laura Adams',
                    'David Clark',
                    'Sarah Lewis'
                  ];
                  List<String> subtitles = [
                    'Certified Personal Trainer\nSpecializing in strength training',
                    'Yoga Instructor\nFocus on mindfulness and flexibility',
                    'Cardio Specialist\nExpert in endurance and HIIT',
                    'Nutrition Coach\nGuidance on balanced diets',
                    'Pilates Instructor\nEmphasis on core strength',
                    'Group Fitness Leader\nEnergetic classes and workshops',
                    'Sports Coach\nExperience in various athletic disciplines',
                    'Rehabilitation Expert\nPost-injury recovery and therapy',
                    'Fitness Enthusiast\nPassionate about all forms of exercise',
                    'Wellness Advocate\nHolistic approach to health and fitness'
                  ];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 122, // Size for the circular image
                        height: 122,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/trainer_$index.jpg'), // Placeholder image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8), // Spacing between image and name
                      Text(
                        names[index], // Trainer's name
                        style: TextStyle(
                          fontSize: 14, // Adjusted font size for names
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4), // Spacing between name and subtitle
                      Text(
                        subtitles[index], // Trainer's subtitle
                        style: TextStyle(
                          fontSize: 16, // Smaller font size for subtitle
                          color: Colors.grey, // Subtitle color
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2, // Limit subtitle to 2 lines
                        overflow: TextOverflow
                            .ellipsis, // Add ellipsis if text overflows
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
