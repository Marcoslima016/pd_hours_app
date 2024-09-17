import 'package:flutter/material.dart';

class MainScreenController {
  late TabController tabController;

  MainScreenController({
    required TickerProvider vsync,
  }) {
    tabController = TabController(
      vsync: vsync,
      length: 2,
    );
  }
}
