import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

class SquadsListPage extends StatefulWidget {
  const SquadsListPage({super.key});

  @override
  State<SquadsListPage> createState() => _SquadsListPageState();
}

class _SquadsListPageState extends State<SquadsListPage> {
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
          AText.h2(
            "Lista de Squads",
            variation: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 36.h),
          Expanded(
            child: ASurfaceContainer(
              child: ValueListenableBuilder(
                valueListenable: SquadsController.I,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: ASpinner(),
    );
  }

  //=======================================================================================================

  Widget _buildTable(ISquadsState state) {
    List<Squad> squadsList = (state as Loaded).squadsList;

    return ListTable(
      isEmpty: false,
      //
      //-----------------------------------------------------------

      headerCells: [
        //

        SizedBox(
          width: 154.sp,
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

        //
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 32.sp),
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

      //-----------------------------------------------------------

      tableLines: List.generate(
        squadsList.length,
        (index) {
          Squad squad = squadsList[index];
          return [
            //

            SizedBox(
              width: 154.sp,
              child: Center(
                child: AText.p(squad.id.toString()),
              ),
            ),

            //
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 32.sp),
                child: AText.p(squad.name),
              ),
            ),

            //
            Padding(
              padding: EdgeInsets.all(5.sp),
              child: ABoxButton.primary(
                onClick: () async {
                  SquadsController.I.onTapVisitSquad(squad);
                },
                text: "Visitar squad",
                active: true,
                small: true,
              ),
            ),
          ];
        },
      ),
    );
  }
}
