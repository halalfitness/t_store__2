import 'package:flutter/material.dart';
import 'package:t_store/common/images/circular_image.dart';
import 'package:t_store/features/authentication/models/active_menberships_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ActiveMembershipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: sampleMemberships.length,
        itemBuilder: (context, index) {
          final membership = sampleMemberships[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                membership.membershipName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: dark ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trainer: ${membership.trainerName}',
                    style: TextStyle(
                      color: dark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  Text(
                    'Style: ${membership.styleOfTraining}',
                    style: TextStyle(
                      color: dark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
              trailing: TCircularImage(
                backgroundColor: Colors.green,
                image: membership.imageUrl,
                isNetworkImage: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
