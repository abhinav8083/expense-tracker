@react.component
let make = () => {
  let currBalance = 10000
  <div className="flex flex-col items-center">
    <h1> {React.string("YOUR BALANCE")} </h1>
    <p className={`font-bold ${currBalance > 0 ? "text-emerald-600" : "text-red-600"}`}>
      <span className={`font-bold ${currBalance > 0 ? "text-emerald-600" : "text-red-600"}`}>
        {React.string(currBalance > 0 ? "+" : "-")}
      </span>
      {React.string("₹")}
      {React.int(abs(currBalance))}
    </p>
  </div>
}
