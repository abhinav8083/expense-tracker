type expenseCategory = {
  label: string,
  isCredit: bool,
  icon: string,
}

//Category data
let expenseCategories: array<string> = [
  "Salary",
  "Housing",
  "Transportation",
  "Food",
  "Entertainment",
  "Education",
  "Clothing",
  "Personal Care",
  "Miscellaneous",
]
module Binddings = {
  @val @acope("window")
  external addEventListener: (string, unit => unit) => unit = "addEventListener"
}

@react.component
let make = (~value: string, ~onChange: string => unit) => {
  // State hooks
  let (query, setQuery) = React.useState(() => value)
  let (filteredSuggestions, setFilteredSuggestions) = React.useState(() => [])

  let (isDropDownOpen, setIsDropDownOpen) = React.useState(_ => false)
  let dropDownRef = React.useRef(Js.Nullable.null)

  let handleClickOutside = event => {
    if %raw(`(dropDownRef.current && !dropDownRef.current.contains(event.target))`) {
      setIsDropDownOpen(_ => false)
    }
  }
  React.useEffect0(() => {
    Binddings.addEventListener("mousedown", handleClickOutside)
    None
  })

  // Handle input change
  let handleInputChange = e => {
    ReactEvent.Form.preventDefault(e)
    let value = ReactEvent.Form.target(e)["value"]
    setQuery(value)
    if value != "" {
      let filtered = expenseCategories->Array.filter(suggestion => {
        Js.String.includes(String.toLowerCase(value), Js.String.toLowerCase(suggestion))
      })
      setFilteredSuggestions(_ => filtered)
      setIsDropDownOpen(_ => true)
    } else {
      setFilteredSuggestions(_ => [])
      setIsDropDownOpen(_ => false)
    }
  }

  // Handle suggestion click
  let handleSuggestionClick = suggestion => {
    setQuery(suggestion)
    setFilteredSuggestions(_ => expenseCategories)
    setIsDropDownOpen(_ => false)
  }

  let renderMenuItems = {
    if isDropDownOpen && filteredSuggestions->Array.length > 0 {
      let renderList = Js.Array.map((item: string) => {
        <h1
          className={`cursor-pointer text-xl rounded border p-5 m-5 flex justify-between   hover:bg-emerald-100  `}
          key={item}
          onClick={_ => {
            setQuery(_ => item)
            setIsDropDownOpen(_ => false)
            onChange(item)
          }}>
          <span> {React.string(item)} </span>
        </h1>
      }, filteredSuggestions)->React.array
      renderList
    } else if isDropDownOpen {
      <h1 className={`cursor-pointer text-xl  p-5 m-5 flex justify-between   `}>
        <span> {React.string("No such category")} </span>
      </h1>
    } else {
      <> </>
    }
  }

  <div className="relative  text-left" ref={ReactDOM.Ref.domRef(dropDownRef)}>
    <span> {React.string("Expense Category")} </span>
    <input
      type_="text"
      value={value}
      onChange={handleInputChange}
      onClick={_ => {
        setFilteredSuggestions(_ => expenseCategories)
        setIsDropDownOpen(_ => true)
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
