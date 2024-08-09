@react.component
let make = () => {
  <div className="w-1/3  m-auto">
    <h1> {React.string("Expense Tracker")} </h1>
    <BalanceCard />
    <IncomeExpenseCard />
    <AddNewTransaction />
    <ExpenseHistory />
  </div>
}
