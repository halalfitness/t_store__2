import 'package:flutter/material.dart';

class DirectMessagesTab extends StatelessWidget {
  const DirectMessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Messages Tab',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
