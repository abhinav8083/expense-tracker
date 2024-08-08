@react.component
let make = () => {
  <div>
    <h1> {React.string("Add Input Fields ")} </h1>
    <button className="bg-emerald-400 w-full p-2 font-bold rounded hover:bg-emerald-600">
      {React.string("Add Transaction")}
    </button>
  </div>
}
