import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class CreateEmployeeModal {
  late BuildContext context;

  final CreateEmployeeController controller;

  CreateEmployeeModal({
    required this.controller,
  });

  Future show({required BuildContext context}) async {
    return await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        this.context = context;

        return Dialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.2),
          child: Stack(
            children: [
              //OUT TAP
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: 1.sw,
                  height: 2.sh,
                  color: Colors.transparent,
                ),
              ),

              //BODY
              body(),
            ],
          ),
        );
      },
    ).then((val) {
      return val;
    });
  }

  Widget body() {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(24.sp),
            padding: AppController.instance.runningInMobile
                ? EdgeInsets.symmetric(
                    vertical: 32.sp,
                    horizontal: 32.sp,
                  )
                : EdgeInsets.symmetric(
                    vertical: 64.sp,
                    horizontal: 32.sp,
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  //

                  AText.h2(
                    "Criar Usuário",
                    variation: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //
                  AppController.instance.runningInMobile ? SizedBox(height: 32.sp) : SizedBox(height: 64.sp),
                  SizedBox(
                    width: 350.w,
                    child: MTextInput(
                      controller: controller.inputName!,
                      hintText: "Digite o nome do usuário",
                      label: "NOME DO USUÁRIO",
                    ),
                  ),

                  //
                  AppController.instance.runningInMobile ? SizedBox(height: 15.sp) : SizedBox(height: 32.sp),
                  SizedBox(
                    width: 350.w,
                    child: MTextInput(
                      controller: controller.inputEstimatedHours!,
                      keyboardType: TextInputType.number,
                      hintText: "Digite a quantidade de horas",
                      label: "HORAS ESTIMADAS DE TRABALHO",
                    ),
                  ),

                  //
                  AppController.instance.runningInMobile ? SizedBox(height: 15.sp) : SizedBox(height: 32.sp),
                  SizedBox(
                    width: 350.w,
                    child: MTextInput(
                      controller: controller.inputSquad!,
                      keyboardType: TextInputType.number,
                      hintText: "Digite o Id da squad",
                      label: "SQUAD",
                      validator: (p0) {
                        if (controller.errorSquadInvalid) {
                          return "";
                        }
                        return null;
                      },
                    ),
                  ),

                  //
                  AppController.instance.runningInMobile ? SizedBox(height: 22.sp) : SizedBox(height: 32.sp),

                  ValueListenableBuilder(
                    valueListenable: controller.validated,
                    builder: (context, validated, child) {
                      return ABoxButton.primary(
                        onClick: () async {
                          controller.onTapCreate(context);
                        },
                        text: "Criar usuário",
                        active: validated,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
