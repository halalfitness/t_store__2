import 'dart:ui';

import 'package:flutter/material.dart';

class ReelPage extends StatefulWidget {
  @override
  _ReelPageState createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '@username',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Caption of the reel goes here...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                ),
                Text('1.2K', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.comment, color: Colors.white),
                  onPressed: () {},
                ),
                Text('300', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
