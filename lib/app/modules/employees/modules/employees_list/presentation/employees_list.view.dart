import 'package:flutter/material.dart';
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
        employeesList.length,
        (index) {
          Employee employee = employeesList[index];
          return [
            //

            SizedBox(
              width: AppController.instance.runningInMobile ? 60.sp : 154.sp,
              child: Center(
                child: AText.p(employee.id.toString()),
              ),
            ),

            //
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 32.sp),
                child: AText.p(employee.name),
              ),
            ),
          ];
        },
      ),
    );
  }
}
