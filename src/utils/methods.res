type t = Dom_storage2.t
let t = Dom_storage2.localStorage
let saveToLocalStorage = (key: string, value: string) => {
  Dom_storage2.setItem(t, key, "value")
}

// TimeAgo.re
// let timeAgo = (timestamp: Js.Date.t) => {
//   let now = Js.Date.make()
//   let diff = Js.Date.diff(now, timestamp, ~unit="second")
// }
