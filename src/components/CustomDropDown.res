type expenseCategory = {
  label: string,
  isCredit: bool,
  icon: string,
}

//Category data
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
    } else {
      setFilteredSuggestions(_ => [])
      setShowDropdown(_ => false)
    }
  }

  // Handle suggestion click
  // let handleSuggestionClick = suggestion => {
  //   setQuery(suggestion)
  //   setFilteredSuggestions(_ => expenseCategories)
  //   setShowDropdown(_ => false)
  // }

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
            setQuery(_ => item.label)
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

// @react.component
// let make = (~csv_link: option<string>, ~payload: Billings.invoice_details) => {
//   let (showOptions, setShowOptions) = React.useState(() => false)
//   let downloadButtonRef = React.useRef(Js.Nullable.null)

//   let toggleOptions = () => {
//     if (!showOptions) {
//       CommonHelper.publishEvent(
//         ~category=GAConfig.Billings.category,
//         ~action=GAConfig.Billings.download_btn_clk,
//         ~label="",
//         (),
//       )
//     }
//     setShowOptions(_ => !showOptions)
//   }

//   React.useEffect0(() => {
//     let handleClickOutside = event => {
//       if %raw(`(downloadButtonRef.current && !downloadButtonRef.current.contains(event.target))`) {
//         setShowOptions(_ => false)
//       }
//     }

//     JsBindings.addWindowEventListener("mousedown", handleClickOutside)
//     Some(_ => JsBindings.removeWindowEventListener("mousedown", handleClickOutside))
//   })

//   <>
//     <div className="c-download-button">
//       <Catalyst.RoundedPrimaryButton
//         buttonProps={Catalyst.ButtonUtils.getDefaultButtonProps(
//           ~label=Text("Download"),
//           ~postfixIcon=showOptions
//             ? <Catalyst.Icon.ExpandLessIcon />
//             : <Catalyst.Icon.ExpandMoreIcon />,
//           ~onSelectCB=_ => toggleOptions(),
//           ~buttonType=Primary,
//           ~className="c-rounded-button-download",
//           (),
//         )}
//       />
//     </div>
//     {switch showOptions {
//     | false => React.null
//     | true =>
//       <div ref={ReactDOM.Ref.domRef(downloadButtonRef)}>
//         <DownloadOptionsCmp csv_link payload />
//       </div>
//     }}
//   </>
// }
