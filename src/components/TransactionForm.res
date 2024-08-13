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

  <div>
    <ExpenseCategoryInput value={transcationCategory} onChange={handleTransactionCatChange} />
    <AmountInputField value={tansactionAmount} onChange={handleTransactionAmountChange} />
    <button
      className={`bg-emerald-400 w-full p-2 font-bold  ${!isValidForm()
          ? "cursor-not-allowed bg-slate-400"
          : ""}`}
      disabled={!isValidForm()}>
      {React.string("Add Transaction")}
    </button>
  </div>
}
