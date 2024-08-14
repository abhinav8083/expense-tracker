open Types

type t = Dom_storage2.t
let t = Dom_storage2.localStorage
let saveToLocalStorage = (key: string, value: string) => {
  Dom_storage2.setItem(t, key, value)
}

type data = transactionData
@scope("JSON") @val
external parseIntoMyData: string => data = "parse"

// open Types
// open Constants

@react.component
let make = () => {
  let defaultTransactionDataString = JSON.stringifyAny(Constants.defaultTransactionData)
  let localStorageData = Dom_storage2.getItem(t, "transcationsData")
  let parsedLocalStorageData = parseIntoMyData(
    localStorageData->Belt.Option.getWithDefault(
      defaultTransactionDataString->Belt.Option.getWithDefault(""),
    ),
  )

  let (expenseFormData, setExpenseFormData) = React.useState(_ => parsedLocalStorageData)

  <div className="w-1/3  m-auto">
    <h1> {React.string("Expense Tracker")} </h1>
    <BalanceCard balance={expenseFormData.expense +. expenseFormData.income} />
    <IncomeExpenseCard income={expenseFormData.income} expense={expenseFormData.expense} />
    <AddNewTransaction data={expenseFormData} onNewTransaction={setExpenseFormData} />
    <ExpenseHistory />
  </div>
}
