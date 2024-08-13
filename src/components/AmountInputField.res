@react.component
let make = (~value: string, ~onChange: string => unit) => {
  <div>
    <span>
      {React.string("Amount")}
      <span> {React.string("(-ve value for debit and +v value for credit)")} </span>
    </span>
    <div className="border-slate-400 border-[1px]  rounded p-2 w-full flex self-center">
      //Amount value
      <input
        type_="number"
        className="w-full outline-none "
        value={value}
        placeholder="Enter amount"
        onChange={(ev: JsxEvent.Form.t) => {
          let target = JsxEvent.Form.target(ev)
          let value: string = target["value"]
          onChange(value)
        }}
      />
    </div>
  </div>
}
