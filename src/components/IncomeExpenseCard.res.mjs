// Generated by ReScript, PLEASE EDIT WITH CARE

import * as JsxRuntime from "react/jsx-runtime";

function IncomeExpenseCard(props) {
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: "INCOME",
                              className: "font-bold text-lg"
                            }),
                        JsxRuntime.jsxs("span", {
                              children: [
                                "+₹",
                                props.income
                              ],
                              className: "text-emerald-600"
                            })
                      ],
                      className: "flex flex-col"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: "EXPENSE",
                              className: "font-bold text-lg"
                            }),
                        JsxRuntime.jsxs("span", {
                              children: [
                                "-₹",
                                Math.abs(props.expense)
                              ],
                              className: "text-red-600"
                            })
                      ],
                      className: "flex flex-col"
                    })
              ],
              className: "flex border justify-between p-5"
            });
}

var make = IncomeExpenseCard;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */
