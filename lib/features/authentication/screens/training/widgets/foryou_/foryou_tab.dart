import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/training/widgets/foryou_/widgets/video_sections.dart';
import 'package:video_player/video_player.dart';

class ForYouTab extends StatefulWidget {
  const ForYouTab({super.key});

  @override
  _ForYouTabState createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab> {
  final PageController _pageControllerNewWorkouts = PageController();
  final PageController _pageControllerGreatForHome = PageController();
  int _currentPageNewWorkouts = 0;
  int _currentPageGreatForHome = 0;

  List<VideoPlayerController> _controllersNewWorkouts = [];
  List<VideoPlayerController> _controllersGreatForHome = [];

  @override
  void initState() {
    super.initState();

    // Initialize controllers for "New Workouts"
    _controllersNewWorkouts = [
      for (var url in [
        "assets/videos/1.mp4",
        'assets/videos/2.mp4',
      ])
        VideoPlayerController.asset(url)
          ..initialize()
          ..setLooping(true)
          ..setVolume(0.0), // Mute sound
    ];

    // Initialize controllers for "Great for Home"
    _controllersGreatForHome = [
      for (var url in [
        'assets/videos/3.mp4',
        'assets/videos/4.mp4',
      ])
        VideoPlayerController.asset(url)
          ..initialize()
          ..setLooping(true)
          ..setVolume(0.0), // Mute sound
    ];
  }

  @override
  void dispose() {
    for (var controller in _controllersNewWorkouts) {
      controller.dispose();
    }
    for (var controller in _controllersGreatForHome) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPageChangedNewWorkouts(int index) {
    setState(() {
      _currentPageNewWorkouts = index;
    });
    _updateVideoPlaybackNewWorkouts();
  }

  void _onPageChangedGreatForHome(int index) {
    setState(() {
      _currentPageGreatForHome = index;
    });
    _updateVideoPlaybackGreatForHome();
  }

  void _updateVideoPlaybackNewWorkouts() {
    for (int i = 0; i < _controllersNewWorkouts.length; i++) {
      if (i == _currentPageNewWorkouts) {
        _controllersNewWorkouts[i].play();
      } else {
        _controllersNewWorkouts[i].pause();
      }
    }
  }

  void _updateVideoPlaybackGreatForHome() {
    for (int i = 0; i < _controllersGreatForHome.length; i++) {
      if (i == _currentPageGreatForHome) {
        _controllersGreatForHome[i].play();
      } else {
        _controllersGreatForHome[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
      child: ListView(
        children: [
          VideoSection(
            title: 'New Workouts',
            videoUrls: const [
              "assets/videos/1.mp4",
              'assets/videos/2.mp4',
            ],
            pageController: _pageControllerNewWorkouts,
            onPageChanged: _onPageChangedNewWorkouts,
            controllers: _controllersNewWorkouts,
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: VideoSection(
              title: 'Great for Home',
              videoUrls: const [
                'assets/videos/3.mp4',
                'assets/videos/4.mp4',
              ],
              pageController: _pageControllerGreatForHome,
              onPageChanged: _onPageChangedGreatForHome,
              controllers: _controllersGreatForHome,
            ),
          ),
        ],
      ),
    );
  }
}
