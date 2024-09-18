import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pd_hours_app/app/presentation/theme/widgets/atoms/box_button.atom.widget.dart';
import 'package:pd_hours_app/lib.exports.dart';

class ListTable extends StatelessWidget {
  ListTable({super.key});

  final List<Widget> _headerValues = [
    SizedBox(
      width: 154.w,
      child: Center(
        child: Text(
          "ID",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 32.w),
        child: Text(
          "Nome",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
  ];

  final List<List<Widget>> _tableLines = [];

  Widget _buildLineTextWidget(BuildContext context, String text) {
    return AText.p(text);
  }

  @override
  Widget build(BuildContext context) {
    _tableLines.add([
      SizedBox(
        width: 154.w,
        child: Center(
          child: _buildLineTextWidget(context, "1"),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 32.w),
          child: _buildLineTextWidget(context, "Front-end"),
        ),
      ),
    ]);
    return Container(
      // width: 1.sw,
      // height: 0.3.sh,
      padding: EdgeInsets.all(32.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 33, 36, 42).withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      // child: _buildEmptyState(context),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 300.h,
      margin: EdgeInsets.only(top: 64.sp),
      child: Column(
        children: [
          //---------------------------------------------------
          // HEADER

          _buildTableHeader(context),

          //-----------------------------------------------------

          // LINES

          _buildTableRows(context),

          // Column(
          //   children: [
          //     Container(
          //       width: 1.sw,
          //       height: 43.h,
          //       decoration: BoxDecoration(color: Color(0xfffafafa)),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildTableRows(BuildContext context) {
    // List<Widget> rowChildren = List.generate(
    //   _tableLines.length,
    //   (index) => _tableLines[index],
    // ).toList();

    List<Widget> rowChildren = List.generate(
      _tableLines.length,
      (index) => Container(
        width: 1.sw,
        height: 43.h,
        decoration: const BoxDecoration(color: Color(0xfffafafa)),
        child: Row(
          children: List.generate(
            _tableLines[index].length,
            (index2) => _tableLines[index][index2],
          ),
        ),
      ),
    ).toList();

    return Column(
      children: rowChildren,
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    List<Widget> headerChildren = List.generate(
      _headerValues.length,
      (index) => _headerValues[index],
    ).toList();

    return Container(
      width: 1.sw,
      height: 43.sp,
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      decoration: BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.sp),
          topRight: Radius.circular(8.sp),
        ),
      ),
      child: Row(
        children: headerChildren,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        SvgPicture.asset(
          width: 128.w,
          "assets/icons/emoji_empty_state.svg",
          // width: 128.sp,
        ),
        SizedBox(height: 24.h),
        AText.p(
          "Nenhuma squad cadastrada. Crie uma squad para começar.",
          variation: TextStyle(
            color: AppTheme.colors.grey3,
          ),
        ),
        SizedBox(height: 64.h),
        ABoxButton.primary(
          onClick: () async {
            SquadsController.I.onTapCreateSquad(context);
          },
          text: "Criar squad",
          active: true,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
