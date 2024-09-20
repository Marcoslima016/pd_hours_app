import 'package:flutter/material.dart';
import 'package:pd_hours_app/app/app.exports.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String tag = "main-screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late final MainScreenController _mainScreenController;

  @override
  void initState() {
    super.initState();
    _mainScreenController = MainScreenController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //
          TopBar(
            tabController: _mainScreenController.tabController,
          ),
          //
          Expanded(
            child: TabBarView(
              controller: _mainScreenController.tabController,
              children: const [
                SquadsScreen(),
                EmployeesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
