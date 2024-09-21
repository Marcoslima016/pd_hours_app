import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

import '../../../presentation/squads.state.dart';

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
    return TPageFrame(
      title: "Lista de Squads",
      body: ValueListenableBuilder(
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
      isEmpty: squadsList.isEmpty,
      name: "squad",
      emptyMessage: "Nenhuma squad cadastrada. Crie uma squad para começar.",
      onTapCreate: () {
        SquadsController.I.onTapRedirectToCreateSquad(context);
      },
      //
      //-----------------------------------------------------------

      headerCells: [
        //

        SizedBox(
          width: AppController.instance.runningInMobile ? 60.sp : 154.sp,
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
            padding: EdgeInsets.only(left: AppController.instance.runningInMobile ? 12.sp : 32.sp),
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
              width: AppController.instance.runningInMobile ? 60.sp : 154.sp,
              child: Center(
                child: AText.p(squad.id.toString()),
              ),
            ),

            //
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: AppController.instance.runningInMobile ? 12.sp : 32.sp),
                child: AText.p(squad.name),
              ),
            ),

            //
            AppController.instance.runningInMobile
                ? InkWell(
                    onTap: () async {
                      SquadsController.I.onTapVisitSquad(squad);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Icon(
                        Icons.chevron_right,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  )
                : Padding(
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
