import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/sub_appbar.dart';
import 'package:t_store/features/authentication/screens/social/widgets/community_tab.dart';
import 'package:t_store/features/authentication/screens/social/widgets/direct_messages.dart';
import 'package:t_store/features/authentication/screens/social/widgets/explore_page.dart';
import 'package:t_store/features/authentication/screens/social/widgets/reels_tab.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> with SingleTickerProviderStateMixin {
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
          title: 'Social',
          tabs: const ['Explore', 'Reels', 'Messages', 'Community'],
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ExplorePage(),
            ReelsTab(),
            DirectMessagesTab(),
            CommunityTab(),
          ],
        ),
      ),
    );
  }
}
