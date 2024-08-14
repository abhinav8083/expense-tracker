type transactionItem = {
  transactionCategory: string,
  amount: float,
  timestamp: Js.Date.t,
}

type transactionData = {
  income: float,
  expense: float,
  transactions: array<transactionItem>,
}

type t = Dom_storage2.t
let t = Dom_storage2.localStorage
let saveToLocalStorage = (key: string, value: string) => {
  Dom_storage2.setItem(t, key, value)
}

type data = transactionData
@scope("JSON") @val
external parseIntoMyData: string => data = "parse"

@react.component
let make = () => {
  let defaultTransactionData = {
    income: 0.0,
    expense: 0.0,
    transactions: [],
  }
  let defaultTransactionDataString = JSON.stringifyAny(defaultTransactionData)
  let localStorageData = Dom_storage2.getItem(t, "transcationsData")
  let parsedLocalStorageData = parseIntoMyData(
    localStorageData->Belt.Option.getWithDefault(
      defaultTransactionDataString->Belt.Option.getWithDefault(""),
    ),
  )
  Js.log(parsedLocalStorageData)
  let (expenseFormData, setExpenseFormData) = React.useState(_ => defaultTransactionData)

  <div className="w-1/3  m-auto">
    <h1> {React.string("Expense Tracker")} </h1>
    <BalanceCard />
    <IncomeExpenseCard />
    <AddNewTransaction />
    <ExpenseHistory />
  </div>
}
