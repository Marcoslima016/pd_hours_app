import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [
          Container(
            width: 1.sw,
            padding: AppController.instance.runningInMobile
                ? EdgeInsets.symmetric(horizontal: 24.sp)
                : EdgeInsets.symmetric(horizontal: 160.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                SizedBox(height: 14.h),

                Image.asset(
                  "assets/images/brand/logo.png",
                  width: 50.w,
                ),

                AppController.instance.runningInMobile
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(height: 46.5.h),
                          AText.h1("PD Hours"),
                          SizedBox(height: 28.h),
                        ],
                      ),

                buildMenu(),
              ],
            ),
          ),
          Container(
            width: 1.sw,
            height: 1.h,
            color: const Color.fromARGB(255, 221, 226, 229),
          ),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return Row(
      children: [
        IntrinsicWidth(
          child: TabBar(
            controller: tabController,
            indicatorWeight: 5.sp,
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              return states.contains(MaterialState.focused) ? null : Colors.transparent;
            }),
            indicatorColor: AppTheme.colors.primary,
            labelStyle: AppTheme.textStyles.p,
            unselectedLabelStyle: AppTheme.textStyles.p.copyWith(
              color: AppTheme.colors.black.withOpacity(0.3),
            ),
            indicatorPadding: EdgeInsets.only(right: AppController.instance.runningInMobile ? 30.sp : 66.sp),
            labelPadding: EdgeInsets.only(right: AppController.instance.runningInMobile ? 30.sp : 66.sp),
            isScrollable: true,
            enableFeedback: false,
            tabs: const [
              Tab(
                text: "Squads",
              ),
              Tab(
                text: "Usuários",
              ),
            ],
          ),
        ),
        // Expanded(child: Container()),
      ],
    );
  }
}
