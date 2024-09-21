import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SquadDetailsController {
  TextEditingController inputInitialDate = TextEditingController();
  TextEditingController inputEndDate = TextEditingController();

  void onSelectInitialDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    inputInitialDate.text = formattedDate;
  }

  void onSelectEndDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    inputEndDate.text = formattedDate;
  }
}
