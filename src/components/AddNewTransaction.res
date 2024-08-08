@react.component
let make = () => {
  <div>
    <h1 className="font-bold text-lg"> {React.string("Add new transaction")} </h1>
    <TransactionForm />
  </div>
}
