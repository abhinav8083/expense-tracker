@react.component
let make = () => {
  // let (currSelectedItem, setSelectedItem) = React.useState(_ => -1)
  // let devtest = ["element 1", "element 2", "element 3", "element 4", "element 5"]
  // let currTitle = devtest[currSelectedItem]

  // let renderAlert =
  // currSelectedItem > -1
  //   ? <h1>
  //       {React.string(
  //         // `Current selected Item is: ${switch currTitle {
  //         //   | Some(v) => v
  //         //   | None => ""
  //         //   }}`,
  //         currTitle->Belt.Option.getWithDefault(""),
  //       )}
  //       <span className="cursor-pointer border p-2" onClick={_ => setSelectedItem(_ => -1)}>
  //         {React.string("X")}
  //       </span>
  //     </h1>
  //   : <> </>

  // let renderList = Js.Array.mapi((str, ind) => {
  //   <h1 className={`cursor-pointer`} key={str} onClick={_ => setSelectedItem(_ => ind)}>
  //     {React.string(`${str} -`)}
  //     {React.int(ind)}
  //   </h1>
  // }, devtest)->React.array
  <div className="p-6 ">
    // renderList
    // renderAlert
    // <ListItem />
    <ExpenseForm />
  </div>
}
