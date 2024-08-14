@react.component
let make = (~data, ~onNewTransaction) => {
  <div>
    <h1 className="font-bold text-lg"> {React.string("Add new transaction")} </h1>
    <TransactionForm data={data} onNewTransaction={onNewTransaction} />
  </div>
}
