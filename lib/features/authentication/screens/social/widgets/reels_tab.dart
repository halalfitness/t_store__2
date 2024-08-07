import 'package:flutter/material.dart';

class ReelsTab extends StatelessWidget {
  const ReelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reels Tab',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
