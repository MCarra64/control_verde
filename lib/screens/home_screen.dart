import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import 'inventory_screen.dart';
import 'summary_screen.dart';
import 'staff_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verdurería el Ahorro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppStyles.primaryGreen,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppStyles.lightBackground,
          labelColor: Colors.white,
          unselectedLabelColor: AppStyles.textLight,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.inventory)),
            Tab(icon: Icon(Icons.show_chart)),
            Tab(icon: Icon(Icons.people)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Inicio', style: TextStyle(fontSize: 18))),
          InventoryScreen(),
          SummaryScreen(),
          StaffScreen(),
        ],
      ),
      backgroundColor: AppStyles.lightBackground,
    );
  }
}