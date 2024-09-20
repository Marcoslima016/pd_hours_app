import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/app.exports.dart';
import 'package:pd_hours_app/app/presentation/presentation.exports.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen>
    with AutomaticKeepAliveClientMixin<EmployeesScreen>, SingleTickerProviderStateMixin {
  late final EmployeesController _employeesController;

  @override
  void initState() {
    super.initState();
    _employeesController = EmployeesController(vsync: this);
    _employeesController.initialize();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: EdgeInsets.only(
        left: 168.sp,
        right: 473.sp,
        top: 59.sp,
        bottom: 100.sp,
      ),
      color: AppTheme.colors.background,
      child: TabBarView(
        controller: _employeesController.tabController,
        children: const [
          EmployeesListPage(),
        ],
      ),
    );
  }
}
