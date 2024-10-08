// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as JsxRuntime from "react/jsx-runtime";

var expenseCategories = [
  {
    label: "Salary",
    isCredit: true,
    icon: "💵"
  },
  {
    label: "Housing",
    isCredit: false,
    icon: "🏠"
  },
  {
    label: "Transportation",
    isCredit: false,
    icon: "🚗"
  },
  {
    label: "Food",
    isCredit: false,
    icon: "🍔"
  },
  {
    label: "Entertainment",
    isCredit: false,
    icon: "🎉"
  },
  {
    label: "Education",
    isCredit: false,
    icon: "🎓"
  },
  {
    label: "Clothing",
    isCredit: false,
    icon: "👕"
  },
  {
    label: "Personal Care",
    isCredit: false,
    icon: "🧴"
  },
  {
    label: "Miscellaneous",
    isCredit: false,
    icon: "🗂️"
  }
];

function CustomDropDown(props) {
  var match = React.useState(function () {
        return "";
      });
  var setQuery = match[1];
  var match$1 = React.useState(function () {
        return [];
      });
  var setFilteredSuggestions = match$1[1];
  var filteredSuggestions = match$1[0];
  var match$2 = React.useState(function () {
        return false;
      });
  var setShowDropdown = match$2[1];
  var showDropdown = match$2[0];
  var handleInputChange = function (e) {
    e.preventDefault();
    var value = e.target.value;
    setQuery(value);
    if (value !== "") {
      var filtered = expenseCategories.filter(function (suggestion) {
            return Js_string.includes(value.toLowerCase(), suggestion.label.toLowerCase());
          });
      setFilteredSuggestions(function (param) {
            return filtered;
          });
      return setShowDropdown(function (param) {
                  return true;
                });
    }
    setFilteredSuggestions(function (param) {
          return [];
        });
    setShowDropdown(function (param) {
          return false;
        });
  };
  var renderMenuItems = showDropdown && filteredSuggestions.length > 0 ? Js_array.map((function (item) {
            return JsxRuntime.jsxs("h1", {
                        children: [
                          JsxRuntime.jsx("span", {
                                children: item.label
                              }),
                          JsxRuntime.jsx("span", {
                                children: item.icon
                              })
                        ],
                        className: "cursor-pointer text-xl rounded border p-5 m-5 flex justify-between   hover:bg-emerald-100  ",
                        onClick: (function (param) {
                            setQuery(function (param) {
                                  return item.label;
                                });
                            setShowDropdown(function (param) {
                                  return false;
                                });
                          })
                      }, item.label);
          }), filteredSuggestions) : (
      showDropdown ? JsxRuntime.jsx("h1", {
              children: JsxRuntime.jsx("span", {
                    children: "No such category"
                  }),
              className: "cursor-pointer text-xl  p-5 m-5 flex justify-between   "
            }) : JsxRuntime.jsx(JsxRuntime.Fragment, {})
    );
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("input", {
                      className: "w-full px-4 py-2 border border-gray-300 rounded-lg",
                      placeholder: "Type to search...",
                      type: "text",
                      value: match[0],
                      onChange: handleInputChange,
                      onClick: (function (param) {
                          setFilteredSuggestions(function (param) {
                                return expenseCategories;
                              });
                          setShowDropdown(function (param) {
                                return true;
                              });
                        })
                    }),
                JsxRuntime.jsx("div", {
                      children: renderMenuItems,
                      className: "overflow-y-auto max-h-96 dropdown-content absolute right-0 mt-2 w-full origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none "
                    })
              ],
              className: "relative  text-left"
            });
}

var make = CustomDropDown;

export {
  expenseCategories ,
  make ,
}
/* react Not a pure module */
