import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/app.exports.dart';
import 'package:pd_hours_app/app/presentation/presentation.exports.dart';

class SquadsScreen extends StatefulWidget {
  const SquadsScreen({super.key});

  @override
  State<SquadsScreen> createState() => _SquadsScreenState();
}

class _SquadsScreenState extends State<SquadsScreen>
    with AutomaticKeepAliveClientMixin<SquadsScreen>, SingleTickerProviderStateMixin {
  late final SquadsController _squadsController;

  @override
  void initState() {
    super.initState();
    _squadsController = SquadsController(vsync: this);
    _squadsController.initialize();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: AppController.instance.runningInMobile
          ? EdgeInsets.only(
              left: 24.sp,
              right: 24.sp,
              top: 24.sp,
              bottom: 24.sp,
            )
          : EdgeInsets.only(
              left: 168.sp,
              right: 473.sp,
              top: 59.sp,
              bottom: 100.sp,
            ),
      color: AppTheme.colors.background,
      child: TabBarView(
        controller: _squadsController.tabController,
        children: const [
          SquadsListPage(),
          SquadDetails(),
        ],
      ),
    );
  }
}
