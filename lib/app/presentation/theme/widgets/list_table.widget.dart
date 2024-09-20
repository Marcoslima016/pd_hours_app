import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pd_hours_app/lib.exports.dart';

class ListTable extends StatelessWidget {
  final List<Widget> headerCells;

  final List<List<Widget>> tableLines;

  final bool isEmpty;

  final String name;

  final String emptyMessage;

  const ListTable({
    super.key,
    required this.headerCells,
    required this.tableLines,
    required this.isEmpty,
    required this.name,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isEmpty == false ? _buildContent(context) : _buildEmptyState(context),
        SizedBox(height: 64.sp),
        ABoxButton.primary(
          onClick: () async {
            SquadsController.I.onTapRedirectToCreateSquad(context);
          },
          text: "Criar $name",
          active: true,
        ),
        SizedBox(height: 32.sp),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 1.sw,
      // height: 300.h,
      margin: EdgeInsets.only(top: 32.sp),
      child: Column(
        children: [
          //---------------------------------------------------
          // HEADER

          _buildTableHeader(context),

          //-----------------------------------------------------

          // LINES

          _buildTableRows(context),
        ],
      ),
    );
  }

  Widget _buildTableRows(BuildContext context) {
    List<Widget> rowChildren = List.generate(
      tableLines.length,
      (index) => Container(
        width: 1.sw,
        height: 43.sp,
        decoration: const BoxDecoration(color: Color(0xfffafafa)),
        child: Row(
          children: List.generate(
            tableLines[index].length,
            (index2) => tableLines[index][index2],
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
      headerCells.length,
      (index) => headerCells[index],
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
        SizedBox(height: 32.sp),
        SvgPicture.asset(
          width: 128.w,
          "assets/icons/emoji_empty_state.svg",
          // width: 128.sp,
        ),
        SizedBox(height: 24.sp),
        AText.p(
          emptyMessage,
          variation: TextStyle(
            color: AppTheme.colors.grey3,
          ),
        ),
      ],
    );
  }
}
