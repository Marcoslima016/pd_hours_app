import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class SquadDetails extends StatefulWidget {
  const SquadDetails({super.key});

  @override
  State<SquadDetails> createState() => _SquadDetailsState();
}

class _SquadDetailsState extends State<SquadDetails> {
  final SquadDetailsController controller = SquadDetailsController();
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  //=======================================================================================================

  Widget _buildBody() {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //- - - - - - - - - - - - - -

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  SquadsController.I.returnToSquadsList();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: AppTheme.colors.primary,
                  size: AppController.instance.runningInMobile ? 22.sp : 38.sp,
                ),
              ),
              SizedBox(width: 15.w),
              AText.h2(
                SquadsController.I.focusedSquad!.name,
                variation: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          //
          //- - - - - - - - - - - - - -
          SizedBox(height: 36.h),
          Expanded(
            child: SizedBox(
              width: 1.sw,
              child: ASurfaceContainer(
                child: Column(
                  children: [
                    //

                    AText.h3("Horas por membro"),

                    //
                    SizedBox(height: 32.sp),
                    SizedBox(
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          Flexible(
                            child: SizedBox(
                              width: 190.w,
                              child: MDatePickerInput(
                                controller: controller.inputInitialDate,
                                label: "Inicio",
                                onSelect: (selectedDate) {
                                  controller.onSelectInitialDate(selectedDate);
                                },
                              ),
                            ),
                          ),

                          //
                          SizedBox(width: 10.sp),
                          Flexible(
                            child: SizedBox(
                              width: 190.w,
                              child: MDatePickerInput(
                                controller: controller.inputEndDate,
                                label: "Fim",
                                onSelect: (selectedDate) {
                                  controller.onSelectEndDate(selectedDate);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
