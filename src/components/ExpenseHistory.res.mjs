// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as JsxRuntime from "react/jsx-runtime";

function ExpenseHistory(props) {
  var data = props.data;
  var match = React.useState(function () {
        return true;
      });
  var setShowHistory = match[1];
  var showHistory = match[0];
  console.log(data);
  var renderTransactionHistory = Js_array.mapi((function (item, ind) {
          return JsxRuntime.jsxs("h1", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: item.transactionCategory
                            }),
                        JsxRuntime.jsx("span", {
                              children: item.amount,
                              className: "text-sm text-blue-600"
                            })
                      ],
                      className: " text-xl rounded border p-5 m-5 flex justify-between	"
                    }, String(ind));
        }), data);
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("div", {
                      children: JsxRuntime.jsx("h1", {
                            children: "Expense History",
                            className: "font-bold text-lg"
                          }),
                      className: "bg-slate-100 flex flex-row justify-between p-2 cursor-pointer",
                      onClick: (function (param) {
                          setShowHistory(function (param) {
                                return !showHistory;
                              });
                        })
                    }),
                showHistory ? JsxRuntime.jsx("div", {
                        children: renderTransactionHistory,
                        className: "max-h-96 overflow-auto border"
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
