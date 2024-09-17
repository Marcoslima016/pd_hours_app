import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/presentation/app.view.dart';

import 'presentation.exports.dart';

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
      body: Column(
        children: [
          // SizedBox(
          //   width: 1.sw,
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 1.sw,
          //         child: TabBar(
          //           controller: _mainScreenController.tabController,
          //           tabs: [
          //             Tab(
          //               text: "aba 1",
          //               icon: Icon(
          //                 Icons.home,
          //                 color: Colors.indigo.shade500,
          //               ),
          //             ),
          //             Tab(
          //               text: "aba 2",
          //               icon: Icon(
          //                 Icons.home,
          //                 color: Colors.indigo.shade500,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       // Expanded(child: Container()),
          //     ],
          //   ),
          // ),

          //- - - - - - - - - - - - - -

          //- - - - - - - - - - - - - -

          Expanded(
            child: TabBarView(
              controller: _mainScreenController.tabController,
              children: [
                Container(
                  child: Text("1 !!!!!"),
                ),
                Container(
                  child: Text("2 !!!!!"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
