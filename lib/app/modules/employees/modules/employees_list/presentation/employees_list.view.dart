import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/lib.exports.dart';

import '../../../presentation/employees.state.dart';

class EmployeesListPage extends StatefulWidget {
  const EmployeesListPage({super.key});

  @override
  State<EmployeesListPage> createState() => _EmployeesListPageState();
}

class _EmployeesListPageState extends State<EmployeesListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  //=======================================================================================================

  Widget _buildBody() {
    return TPageFrame(
      title: "Lista de Usuários",
      body: ValueListenableBuilder(
        valueListenable: EmployeesController.I,
        builder: (context, IEmployeesState state, child) {
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

  Widget _buildTable(IEmployeesState state) {
    List<Employee> employeesList = (state as Loaded).employeesList;

    return ListTable(
      isEmpty: employeesList.isEmpty,
      name: "usuário",
      emptyMessage: "Nenhum usuário cadastrado. Crie um usuário para começar.",
      onTapCreate: () {
        EmployeesController.I.onTapRedirectToCreateEmployee(context);
      },
      //
      //-----------------------------------------------------------

      headerCells: [
        //

        //
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: AppController.instance.runningInMobile ? 8.sp : 16.sp),
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

        SizedBox(
          width: AppController.instance.runningInMobile ? 60.sp : 100.sp,
          child: Center(
            child: Text(
              "Horas",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),

        Container(
          width: AppController.instance.runningInMobile ? 60.sp : 100.sp,
          margin: AppController.instance.runningInMobile
              ? EdgeInsets.only(left: 5.sp, right: 5.sp)
              : EdgeInsets.only(left: 32.sp, right: 32.sp),
          child: Center(
            child: Text(
              "Squad ID",
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
        employeesList.length,
        (index) {
          Employee employee = employeesList[index];
          return [
            //

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: AppController.instance.runningInMobile ? 8.sp : 16.sp),
                child: AText.p(employee.name.toString()),
              ),
            ),

            //
            SizedBox(
              width: AppController.instance.runningInMobile ? 60.sp : 100.sp,
              child: Center(
                child: AText.p(employee.estimatedHours.toString()),
              ),
            ),

            //
            Container(
              width: AppController.instance.runningInMobile ? 60.sp : 100.sp,
              margin: AppController.instance.runningInMobile
                  ? EdgeInsets.only(left: 5.sp, right: 5.sp)
                  : EdgeInsets.only(left: 32.sp, right: 32.sp),
              child: Center(
                child: AText.p(employee.squadId.toString()),
              ),
            ),
          ];
        },
      ),
    );
  }
}
