import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class TPageFrame extends StatelessWidget {
  final String title;

  final Widget body;

  const TPageFrame({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AText.h2(
            title,
            variation: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 36.h),
          Expanded(
            child: ASurfaceContainer(
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
