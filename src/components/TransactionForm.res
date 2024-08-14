type t = Dom_storage2.t
let t = Dom_storage2.localStorage
let saveToLocalStorage = (key: string, value: string) => {
  Dom_storage2.setItem(t, key, value)
}
// let getFromLocalStorage = (key: string) =>
//   switch Dom_storage2.getItem(key) {
//   | Some(value) => Some(value)
//   | None => None
//   }

type newTransaction = {
  transactionCategory: string,
  transactionAmount: string,
  timestamp: Js.Date.t,
}
type data = array<newTransaction>
@scope("JSON") @val
external parseIntoMyData: string => data = "parse"

@react.component
let make = () => {
  let (tansactionAmount, setTransactionAmount) = React.useState(_ => "")
  let handleTransactionAmountChange = val => {
    setTransactionAmount(_ => val)
  }

  let (transcationCategory, setTransactionCategory) = React.useState(_ => "")
  let handleTransactionCatChange = val => {
    setTransactionCategory(_ => val)
  }

  let isValidForm = () => {
    transcationCategory !== "" && tansactionAmount !== ""
  }
  let handleSubmitTransaction = () => {
    //Reset input fields
    setTransactionAmount(_ => "")
    setTransactionCategory(_ => "")
    //Add amount and category to context state and localstorage so the we can use in future session also

    let localStorageData = Dom_storage2.getItem(t, "transcationsData")

    let newTransactionVal = [
      {
        transactionCategory: transcationCategory,
        transactionAmount: tansactionAmount,
        timestamp: Js.Date.make(),
      },
    ]
    let transactionHistoryData = parseIntoMyData(localStorageData->Belt.Option.getWithDefault(""))
    let updatedTransactionHistory = Belt.Array.concat(newTransactionVal, transactionHistoryData)
    let updatedTransactionHistoryString = JSON.stringifyAny(updatedTransactionHistory)
    saveToLocalStorage(
      "transcationsData",
      updatedTransactionHistoryString->Belt.Option.getWithDefault(""),
    )
  }

  <div>
    <ExpenseCategoryInput value={transcationCategory} onChange={handleTransactionCatChange} />
    <AmountInputField value={tansactionAmount} onChange={handleTransactionAmountChange} />
    <button
      className={`bg-emerald-400 w-full p-2 font-bold  ${!isValidForm()
          ? "cursor-not-allowed bg-slate-400"
          : ""}`}
      disabled={!isValidForm()}
      onClick={_ => handleSubmitTransaction()}>
      {React.string("Add Transaction")}
    </button>
  </div>
}
