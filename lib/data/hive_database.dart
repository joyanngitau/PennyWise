import 'package:hive/hive.dart';
import '../models/expenses_item.dart';

class HiveDataBase {
  //reference our box
  final _myBox = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    /* 
      
      Hive can only store strings and dateTime, and not custom objects like ExpenseItem
      so lets convert  the expense item objects to a list of types that we can store in hive

      allExpense =

      [

        ExpenseItem (name / amount / dateTime )
        ..

      ]

      ->

      [

        [name, amount, dateTime],
        ..

      ]
      
    */

    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpense) {
      //convert each expenseItem into a list of storable types(strings, dateTime)
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    //finally lets store in our database!
    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    /*

    Data is tored in hive as a list of strings + datetime so lets convert our saved data into ExpenseItem objects

    savedData = 

    [

      [ name, amount, dateTime ],
      ..

    ]

    ->

    [

      ExpenseItem ( name / amount /dateTime ),
      ..

    ]

    */

    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      //collect individual expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];

      //create expense item
      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: savedExpenses[i][2],
      );

      //add expense to overall list of expenses
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
