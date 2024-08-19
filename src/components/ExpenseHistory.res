//Can be of 2 types here 1. will be show in expense form itself and the other one on a separate page /history
open Types
@react.component
let make = (~data: array<transactionItem>) => {
  let (showHistory, setShowHistory) = React.useState(_ => true)
  Js.log(data)
  let renderTransactionHistory = Js.Array.mapi((item: transactionItem, ind) => {
    <h1
      className={` text-xl rounded border p-5 m-5 flex justify-between	`}
      key={Belt.Int.toString(ind)}>
      <span> {React.string(item.transactionCategory)} </span>
      <span className="text-sm text-blue-600"> {React.float(item.amount)} </span>
    </h1>
  }, data)->React.array
  <div className="mt-5">
    <div
      className="bg-slate-100 flex flex-row justify-between p-2 cursor-pointer"
      onClick={_ => setShowHistory(_ => !showHistory)}>
      <h1 className="font-bold text-lg"> {React.string("Expense History")} </h1>
      // <span className={`text-xl z-0 origin-center ${showHistory ? "-rotate-90" : "rotate-90"} `}>
      //   {React.string(">")}
      // </span>
    </div>
    {showHistory
      ? <div className="max-h-96 overflow-auto border"> renderTransactionHistory </div>
      : <> </>}
  </div>
}
