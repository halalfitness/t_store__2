import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/sub_appbar.dart';
import 'package:t_store/features/authentication/screens/training/widgets/browse_tab.dart';
import 'package:t_store/features/authentication/screens/training/widgets/foryou_/foryou_tab.dart';
import 'package:t_store/features/authentication/screens/training/widgets/guidance_tab.dart';
import 'package:t_store/features/authentication/screens/training/widgets/trainers.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TSubAppBar(
          title: 'Training',
          tabs: const ['For You', 'Browse', 'Guidance', 'Trainers'],
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ForYouTab(),
            BrowseTab(),
            GuidanceTab(),
            TrainerListScreen(),
          ],
        ),
      ),
    );
  }
}
