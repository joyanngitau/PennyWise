import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_expenses_tracker/data/expense_data.dart';
import 'package:flutter_expenses_tracker/bar graph/bar_gragh.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: maxY,
          sunAmount: sunAmount,
          monAmount: monAmount,
          tueAmount: tueAmount,
          wedAmount: wedAmount,
          thurAmount: thurAmount,
          friAmount: friAmount,
          satAmount: satAmount,
        ),
      ),
    );
  }
}
