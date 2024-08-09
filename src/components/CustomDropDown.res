type expenseCategory = {
  label: string,
  isCredit: bool,
  icon: string,
}

let expenseCategories: array<expenseCategory> = [
  {
    label: "Salary",
    isCredit: true,
    icon: "💵",
  },
  {
    label: "Housing",
    isCredit: false,
    icon: "🏠",
  },
  {
    label: "Transportation",
    isCredit: false,
    icon: "🚗",
  },
  {
    label: "Food",
    isCredit: false,
    icon: "🍔",
  },
  {
    label: "Entertainment",
    isCredit: false,
    icon: "🎉",
  },
  {
    label: "Education",
    isCredit: false,
    icon: "🎓",
  },
  {
    label: "Clothing",
    isCredit: false,
    icon: "👕",
  },
  {
    label: "Personal Care",
    isCredit: false,
    icon: "🧴",
  },
  {
    label: "Miscellaneous",
    isCredit: false,
    icon: "🗂️",
  },
]

@react.component
let make = () => {
  // State hooks
  let (query, setQuery) = React.useState(() => "")
  let (filteredSuggestions, setFilteredSuggestions) = React.useState(() => [])
  let (showDropdown, setShowDropdown) = React.useState(() => false)

  // Handle input change
  let handleInputChange = e => {
    ReactEvent.Form.preventDefault(e)
    let value = ReactEvent.Form.target(e)["value"]
    setQuery(value)
    if value != "" {
      let filtered = expenseCategories->Array.filter(suggestion => {
        Js.String.includes(String.toLowerCase(value), Js.String.toLowerCase(suggestion.label))
      })
      setFilteredSuggestions(_ => filtered)
      setShowDropdown(_ => true)
      Js.log(filtered)
    } else {
      setFilteredSuggestions(_ => [])
      setShowDropdown(_ => false)
    }
  }

  // Handle suggestion click
  let handleSuggestionClick = suggestion => {
    setQuery(suggestion)
    setFilteredSuggestions(_ => expenseCategories)
    setShowDropdown(_ => false)
  }

  // Handle outside click to close dropdown
  //   let ref = React.useRef(None)
  //   let handleClickOutside = e => {
  //     switch ref.current {
  //     | Some(node) if node->Js.Nullable.to_option->Option.is_some =>
  //       if (
  //         node
  //         ->Js.Nullable.to_option
  //         ->Option.get
  //         ->Js.Int32.equal(e.target->Js.Nullable.to_option->Option.get->Js.Int32.compare) == 0
  //       ) {
  //         setShowDropdown(false)
  //       }
  //     | _ => ()
  //     }
  //   }

  //   React.useEffect1(() => {
  //     // let handleClickOutside = (e: Js.Dict.t) => {
  //     //   handleClickOutside(e)
  //     // }
  //     Js.Global.addEventListener("mousedown", handleClickOutside)
  //     Some(() => Js.Global.removeEventListener("mousedown", handleClickOutside))
  //   }, [])
  let renderMenuItems = {
    if showDropdown && filteredSuggestions->Array.length > 0 {
      let renderList = Js.Array.map((item: expenseCategory) => {
        <h1
          className={`cursor-pointer text-xl rounded border p-5 m-5 flex justify-between   hover:bg-emerald-100  `}
          key={item.label}
          onClick={_ => {
            setQuery(_ => item.label ++ " " ++ item.icon)
            setShowDropdown(_ => false)
          }}>
          <span> {React.string(item.label)} </span>
          <span> {React.string(item.icon)} </span>
        </h1>
      }, filteredSuggestions)->React.array
      renderList
    } else if showDropdown {
      <h1 className={`cursor-pointer text-xl  p-5 m-5 flex justify-between   `}>
        <span> {React.string("No such category")} </span>
      </h1>
    } else {
      <> </>
    }
  }

  <div className="relative  text-left">
    <input
      type_="text"
      value={query}
      onChange={handleInputChange}
      onClick={_ => {
        setFilteredSuggestions(_ => expenseCategories)
        setShowDropdown(_ => true)
      }}
      //   ref={ref}
      className="w-full px-4 py-2 border border-gray-300 rounded-lg"
      placeholder="Type to search..."
    />
    <div
      className="overflow-y-auto max-h-96 dropdown-content absolute right-0 mt-2 w-full origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none ">
      renderMenuItems
    </div>
  </div>
}
