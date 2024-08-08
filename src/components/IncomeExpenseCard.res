@react.component
let make = () => {
  <div className="flex border justify-between p-5">
    <div className="flex flex-col">
      <span className="font-bold text-lg"> {React.string("INCOME")} </span>
      <span className="text-emerald-600">
        {React.string("+₹")}
        {React.int(100)}
      </span>
    </div>
    <div className="flex flex-col">
      <span className="font-bold text-lg"> {React.string("EXPENSE")} </span>
      <span className="text-red-600">
        {React.string("-₹")}
        {React.int(100)}
      </span>
    </div>
  </div>
}
