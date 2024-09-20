import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class MTextInput extends StatelessWidget {
  final String? Function(String?)? validator;
  static BorderRadius borderRadius = BorderRadius.circular(8.sp);

  final TextEditingController controller;

  final bool obscure;

  /// Texto exibido quando não tem valor inserido no input.
  ///
  /// Serve para indicar ao usuário qual informação deve ser inserida no input,
  /// além de poder exibir um exemplo.
  final String hintText;

  final String? label;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;

  const MTextInput({
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.obscure = false,
    this.keyboardType,
    this.label,
    this.validator,
    super.key,
  });

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
        TextFormField(
          controller: controller,
          obscureText: obscure,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Color.fromARGB(255, 58, 58, 58),
            fontWeight: FontWeight.w300,
            height: 1.3,
          ),
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            fillColor: AppTheme.colors.surface,
            contentPadding: EdgeInsets.only(top: 20.sp, bottom: 20.sp, left: 16.sp),
            filled: true,
            hintText: hintText,
            helperText: " ",
            helperStyle: const TextStyle(fontSize: 1),
            hintStyle: TextStyle(
              fontSize: AppController.instance.runningInMobile ? 16.sp : 20.sp,
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
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                width: 1.8.sp,
                color: const Color.fromARGB(255, 223, 60, 48),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
