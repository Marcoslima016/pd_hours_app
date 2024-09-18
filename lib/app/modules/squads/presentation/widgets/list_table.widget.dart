import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pd_hours_app/app/presentation/theme/widgets/atoms/box_button.atom.widget.dart';
import 'package:pd_hours_app/lib.exports.dart';

class ListTable extends StatelessWidget {
  const ListTable({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: _buildEmptyState(context),
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
