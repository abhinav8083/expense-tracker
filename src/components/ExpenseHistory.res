//Can be of 2 types here 1. will be show in expense form itself and the other one on a separate page /history

@react.component
let make = () => {
  let (showHistory, setShowHistory) = React.useState(_ => true)
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
      ? <div className="divide-y divide-slate-200">
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
          <SingleHistoryItem />
        </div>
      : <> </>}
  </div>
}
