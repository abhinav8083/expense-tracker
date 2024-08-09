@react.component
let make = () => {
  <div>
    <ExpenseCategoryInput />
    <AmountInputField />
    <button className="bg-emerald-400 w-full p-2 font-bold rounded hover:bg-emerald-600">
      {React.string("Add Transaction")}
    </button>
  </div>
}
