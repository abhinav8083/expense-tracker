// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as JsxRuntime from "react/jsx-runtime";

function ExpenseHistory(props) {
  var match = React.useState(function () {
        return true;
      });
  var setShowHistory = match[1];
  var showHistory = match[0];
  var renderTransactionHistory = Js_array.mapi((function (item, ind) {
          return JsxRuntime.jsxs("h1", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: item.transactionCategory
                            }),
                        JsxRuntime.jsxs("span", {
                              children: [
                                item.amount < 0.0 ? "-" : "+",
                                "₹",
                                Math.abs(item.amount)
                              ],
                              className: "text-sm  rounded justify-center border-r align-middle text-white   font-mono p-2 " + (
                                item.amount > 0.0 ? "bg-green-500 " : "bg-red-500 flex "
                              )
                            })
                      ],
                      className: " text-xl rounded  hover:bg-slate-50 p-3 flex justify-between	"
                    }, String(ind));
        }), props.data);
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("h1", {
                              children: "Expense History",
                              className: "font-bold text-lg"
                            }),
                        JsxRuntime.jsx("span", {
                              children: showHistory ? "Hide" : "Show",
                              className: "text-sm text-blue-600"
                            })
                      ],
                      className: "bg flex flex-row justify-between p-2 cursor-pointer",
                      onClick: (function (param) {
                          setShowHistory(function (param) {
                                return !showHistory;
                              });
                        })
                    }),
                showHistory ? JsxRuntime.jsx("div", {
                        children: renderTransactionHistory,
                        className: "max-h-96 divide-y divide-dashed overflow-auto border"
                      }) : JsxRuntime.jsx(JsxRuntime.Fragment, {})
              ],
              className: "mt-5"
            });
}

var make = ExpenseHistory;

export {
  make ,
}
/* react Not a pure module */
