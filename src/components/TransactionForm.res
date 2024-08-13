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

  <div>
    <ExpenseCategoryInput value={transcationCategory} onChange={handleTransactionCatChange} />
    <AmountInputField value={tansactionAmount} onChange={handleTransactionAmountChange} />
    <button className="bg-emerald-400 w-full p-2 font-bold rounded hover:bg-emerald-600">
      {React.string("Add Transaction")}
    </button>
  </div>
}
