//Can be of 2 types here 1. will be show in expense form itself and the other one on a separate page /history

@react.component
let make = () => {
  <div>
    <h1 className="font-bold text-lg"> {React.string("Expense History")} </h1>
    <div>
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
      <SingleHistoryItem />
    </div>
  </div>
}
