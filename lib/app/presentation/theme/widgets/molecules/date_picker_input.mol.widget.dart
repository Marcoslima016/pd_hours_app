import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class MDatePickerInput extends StatelessWidget {
  const MDatePickerInput({
    super.key,
    this.label,
    required this.controller,
    required this.onSelect,
  });

  final TextEditingController controller;

  static BorderRadius borderRadius = BorderRadius.circular(8.sp);

  final Function(DateTime selectedDate) onSelect;

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: AText.h5(
                  label!,
                  variation: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 172, 181, 189),
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 56.sp,
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              onSelect(pickedDate!);
            },
            style: const TextStyle(
              color: Color.fromARGB(255, 127, 127, 127),
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.calendar_today,
                size: AppController.instance.runningInMobile ? 20.sp : 24.sp,
                color: const Color.fromARGB(255, 232, 232, 232),
              ),
              fillColor: AppTheme.colors.surface,
              // filled: true,
              hintText: "00/00/0000",
              hintStyle: TextStyle(
                fontSize: AppController.instance.runningInMobile ? 15.sp : 20.sp,
                color: const Color.fromARGB(255, 236, 236, 236),
                fontWeight: FontWeight.w400,
                height: 1,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 234, 234, 234),
                  width: 1.4.sp,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  width: 1.8.sp,
                  color: AppTheme.colors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
