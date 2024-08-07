import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: dark ? Colors.black : Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 6),
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                filled: true,
                fillColor: dark ? Colors.black : Colors.white,
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: dark ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 4, // Reduced space between columns
            mainAxisSpacing: 4, // Reduced space between rows
            childAspectRatio: 1, // Aspect ratio of the items
          ),
          itemCount: 15, // Number of items
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.video_library,
                  size: 50,
                  color: Colors.grey[700],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
