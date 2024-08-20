//Can be of 2 types here 1. will be show in expense form itself and the other one on a separate page /history
open Types
@react.component
let make = (~data: array<transactionItem>) => {
  let (showHistory, setShowHistory) = React.useState(_ => true)
  let renderTransactionHistory =
    Array.length(data) > 0 ? Js.Array.mapi((item: transactionItem, ind) => {
          <h1
            className={` text-xl rounded  hover:bg-slate-50 p-3 flex justify-between	`}
            key={Belt.Int.toString(ind)}>
            <span> {React.string(item.transactionCategory)} </span>
            <span
              className={`text-sm  rounded justify-center border-r align-middle text-white   font-mono p-2 ${item.amount > 0.0
                  ? "bg-green-500 "
                  : "bg-red-500 flex "}`}>
              {React.string(item.amount < 0.0 ? "-" : "+")}
              {React.string("₹")}
              {React.float(abs_float(item.amount))}
            </span>
          </h1>
        }, data)->React.array : <p className="text-center ">
          {React.string("No transaction Found!")}
        </p>
  <div className="mt-5">
    <div
      className="bg flex flex-row justify-between p-2 cursor-pointer"
      onClick={_ => setShowHistory(_ => !showHistory)}>
      <h1 className="font-bold text-lg"> {React.string("Expense History")} </h1>
      <span className={`text-sm text-blue-600`}>
        {React.string(showHistory ? "Hide" : "Show")}
      </span>
    </div>
    {showHistory
      ? <div className="max-h-96 divide-y divide-dashed overflow-auto border">
          renderTransactionHistory
        </div>
      : <> </>}
  </div>
}
