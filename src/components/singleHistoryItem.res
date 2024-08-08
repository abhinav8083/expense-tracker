@react.component
let make = () => {
  let currentExpense = 10000
  <div
    className={`flex flex-row justify-between  m-2 p-2  border-1  ${currentExpense >= 0
        ? "border-r-emerald-500  border-r-4"
        : "border-r-red-500"} border-r-4`}>
    <div className="items-center">
      <span className="m-2"> {React.string("Salary")} </span>
      <span> {React.string("💵")} </span>
    </div>
    <div> {React.int(currentExpense)} </div>
  </div>
}
