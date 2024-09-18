import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class ABoxButton extends StatelessWidget {
  final Future Function() onClick;

  final String text;

  final bool active;

  late final Color corPrincipal;

  late final Color corTexto;

  ABoxButton.primary({
    super.key,
    required this.onClick,
    required this.text,
    required this.active,
  }) {
    corPrincipal = AppTheme.colors.primary;
    corTexto = Colors.grey[800]!;
  }

  ABoxButton.cancel({
    super.key,
    required this.onClick,
    required this.text,
    required this.active,
  }) {
    corPrincipal = Colors.red[600]!;
    corTexto = Colors.grey[50]!;
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    if (active) {
      backgroundColor = AppTheme.colors.primary;
      textColor = const Color.fromARGB(255, 241, 241, 241);
    } else {
      backgroundColor = Colors.grey[300]!;
      textColor = const Color.fromARGB(255, 241, 241, 241);
    }

    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.only(
            top: 0.sp,
            bottom: 0.sp,
            left: 50.sp,
            right: 50.sp,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
      ),
      onPressed: active ? onClick : () {},
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
