@react.component
let make = () => {
  <div>
    <span> {React.string("Amount")} </span>
    <div className="border-slate-400 border-[1px]  rounded p-2 w-full flex self-center">
      //Sign label for credit + for debit  -
      <span className="pr-2 text-2xl"> {React.string("+")} </span>
      //Amount value
      <input type_="number" className="w-full outline-none " placeholder="Enter amount" />
    </div>
  </div>
}
