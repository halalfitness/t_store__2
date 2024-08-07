import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Groups & Events Tab',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
