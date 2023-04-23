class ExpenseData {
  //list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  //get expense list
  List<ExpenseItem> getAllExpenseList = () {
    return overallExpenseList;
  }

  //add now expense
  void addNewExpenses(ExpenseItem newExpense){
    overallExpenseList.add(newExpense);
  }

  //delete expense
  void deleteExpense(ExpenseItem expense){
    overallExpensesList.remove(expense);
  }

  //get weekday[mon, tue, etc] frome dateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
      return 'Mon';
      case 2:
      return 'Tue';
      case 3:
      return 'Wed';
      case 4:
      return 'Thur';
      case 5:
      return 'Fri';
      case 6:
      return 'Sat';
      case 7:
      return 'Sun';
      default:
      return '';
    }
  }

  //get the date for the start of the week9sunday
  DateTime startOfWeek(){
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now[];

    //go backwards from today to find sunday
    for ( int i = 0; i < 7; i++){
      if(getDayName(today.subtract(Duration(days: 1))) =='Sun'){
        startOfWeek = today.subtract(Duration(days: 1));
      }
    }

    return startOfWeek;
  }

  /*
  convert overall list  of expenses into a daily summary

  e.g.

  overallExpenseList = 

  [

    [food, 2023/01/30, $10],
    [food, 2023/01/30, $15],
    [food, 2023/01/31, $1],
    [food, 2023/02/01, $5],
    [food, 2023/02/01, $6],
    [food, 2023/02/03, $7],
    [food, 2023/02/05, $10],
    [food, 2023/02/05, $11],

  ]

  ->

  DailyExpenseSummary =

  [
    [2023/01/30: $25 ],
    [2023/01/31: $1 ],
    [2023/01/01: $11 ],
    [2023/01/03: $7 ],
    [2023/01/05: $21 ],
  ]

  */
  Map<String,double> calculateDailyExpenseSummary(){
    Map<String, double> dailyExpenseSummary = {
      //date(yyyymmdd) : amountTotalFOrDay
    };
  }
}
