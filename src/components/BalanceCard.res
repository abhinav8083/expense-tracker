@react.component
let make = (~balance: float) => {
  <div className="flex flex-col items-center">
    <h1> {React.string("YOUR BALANCE")} </h1>
    <p className={`font-bold ${balance > 0.0 ? "text-emerald-600" : "text-red-600"}`}>
      <span className={`font-bold ${balance > 0.0 ? "text-emerald-600" : "text-red-600"}`}>
        {React.string(balance > 0.0 ? "+" : "-")}
      </span>
      {React.string("₹")}
      {React.float(abs_float(balance))}
    </p>
  </div>
}
