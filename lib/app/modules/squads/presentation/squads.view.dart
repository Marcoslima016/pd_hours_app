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
              return Container();
            } else if (state is Loaded) {
              return buildTable(state);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget buildTable(ISquadsState state) {
    return ListTable();
    // if (state.squadsList!.isNotEmpty) {
    //   return ListTable();
    // } else {
    //   return Container();
    // }
  }
}
