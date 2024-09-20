import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/app.exports.dart';

class SquadsScreen extends StatefulWidget {
  const SquadsScreen({super.key});

  @override
  State<SquadsScreen> createState() => _SquadsScreenState();
}

class _SquadsScreenState extends State<SquadsScreen> {
  final SquadsController _squadsController = SquadsController();

  @override
  void initState() {
    super.initState();
    _squadsController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: EdgeInsets.only(
        left: 168.w,
        right: 473.w,
        top: 119.h,
        // bottom: 119.h,
      ),
      color: AppTheme.colors.background,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: _squadsController,
          builder: (context, ISquadsState state, child) {
            if (state is Loading) {
              return _buildLoadingState();
            } else if (state is Loaded) {
              return _buildTable(state);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: ASpinner(),
    );
  }

  Widget _buildTable(ISquadsState state) {
    List<Squad> squadsList = (state as Loaded).squadsList;

    return ListTable(
      isEmpty: false,
      headerCells: [
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
      ],
      tableLines: List.generate(
        squadsList.length,
        (index) {
          Squad squad = squadsList[index];
          return [
            SizedBox(
              width: 154.w,
              child: Center(
                child: AText.p(squad.id.toString()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: AText.p(squad.name),
              ),
            ),
          ];
        },
      ),
    );
  }
}
