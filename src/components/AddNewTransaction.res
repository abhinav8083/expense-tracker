@react.component
let make = (~data) => {
  <div>
    <h1 className="font-bold text-lg"> {React.string("Add new transaction")} </h1>
    <TransactionForm data={data} />
  </div>
}
