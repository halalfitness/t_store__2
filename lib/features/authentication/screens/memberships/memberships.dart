import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/sub_appbar.dart';
import 'package:t_store/features/authentication/screens/memberships/widgets/active.dart';
import 'package:t_store/features/authentication/screens/memberships/widgets/available.dart';
import 'package:t_store/features/authentication/screens/memberships/widgets/history.dart';
import 'package:t_store/features/authentication/screens/memberships/widgets/privilages.dart';

class Memberships extends StatefulWidget {
  const Memberships({super.key});

  @override
  _MembershipsState createState() => _MembershipsState();
}

class _MembershipsState extends State<Memberships>
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
          title: 'Memberships',
          tabs: const ['Active', 'Available', 'History', 'Privilages'],
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ActiveMembershipsScreen(),
            AvailablePlansTab(),
            PaymentHistoryTab(),
            PrivilegesTab(),
          ],
        ),
      ),
    );
  }
}
