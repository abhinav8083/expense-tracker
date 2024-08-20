// Generated by ReScript, PLEASE EDIT WITH CARE

import * as JsxRuntime from "react/jsx-runtime";

function BalanceCard(props) {
  var balance = props.balance;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("h1", {
                      children: "YOUR BALANCE"
                    }),
                JsxRuntime.jsxs("p", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: balance > 0.0 ? "+" : "-",
                              className: "font-bold " + (
                                balance > 0.0 ? "text-emerald-600" : "text-red-600"
                              )
                            }),
                        "₹",
                        Math.abs(balance)
                      ],
                      className: "font-bold " + (
                        balance > 0.0 ? "text-emerald-600" : "text-red-600"
                      )
                    })
              ],
              className: "flex flex-col items-center"
            });
}

var make = BalanceCard;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */
