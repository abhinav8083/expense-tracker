type response
@val external fetch: string => promise<response> = "fetch"
@send external json: response => promise<'a> = "json"

type user = {
  id: int,
  name: string,
  username: string,
  // email: string,
  // address: string,
  // phone: string,
  // website: string,
  // company: string,
}
@react.component
let make = () => {
  let api_url = "https://jsonplaceholder.typicode.com/users"
  let (usersData, setUsersData) = React.useState(_ => [])
  let (currItemSelected, setCurrItemSelected) = React.useState(_ => 0)

  let makeRequest = async url => {
    let response = await fetch(url)
    let json = await response->json
    setUsersData(_ => json)
    None
  }

  React.useEffect(() => {
    api_url->makeRequest->ignore
    None
  }, [])

  let renderList = Js.Array.mapi((item: user, ind) => {
    <h1
      className={`cursor-pointer text-xl rounded border p-5 m-5 flex justify-between ${ind ===
          currItemSelected
          ? "bg-emerald-100"
          : ""}  hover:bg-emerald-100  hover:scale-105	`}
      key={item.username}
      onClick={_ => setCurrItemSelected(_ => ind)}>
      <span> {React.string(item.name)} </span>
      <span className="text-sm text-blue-600">
        {React.string("@")}
        {React.string(item.username)}
      </span>
    </h1>
  }, usersData)->React.array

  <div> renderList </div>
}
