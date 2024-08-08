// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as JsxRuntime from "react/jsx-runtime";

function ListItem(props) {
  var match = React.useState(function () {
        return [];
      });
  var setUsersData = match[1];
  var match$1 = React.useState(function () {
        return 0;
      });
  var setCurrItemSelected = match$1[1];
  var currItemSelected = match$1[0];
  var makeRequest = async function (url) {
    var response = await fetch(url);
    var json = await response.json();
    setUsersData(function (param) {
          return json;
        });
  };
  React.useEffect((function () {
          makeRequest("https://jsonplaceholder.typicode.com/users");
        }), []);
  var renderList = Js_array.mapi((function (item, ind) {
          return JsxRuntime.jsxs("h1", {
                      children: [
                        JsxRuntime.jsx("span", {
                              children: item.name
                            }),
                        JsxRuntime.jsxs("span", {
                              children: [
                                "@",
                                item.username
                              ],
                              className: "text-sm text-blue-600"
                            })
                      ],
                      className: "cursor-pointer text-xl rounded border p-5 m-5 flex justify-between " + (
                        ind === currItemSelected ? "bg-emerald-100" : ""
                      ) + "  hover:bg-emerald-100  hover:scale-105	",
                      onClick: (function (param) {
                          setCurrItemSelected(function (param) {
                                return ind;
                              });
                        })
                    }, item.username);
        }), match[0]);
  return JsxRuntime.jsx("div", {
              children: renderList
            });
}

var make = ListItem;

export {
  make ,
}
/* react Not a pure module */
