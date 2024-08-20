type transactionItem = {
  transactionCategory: string,
  amount: float,
  timestamp: Js.Date.t,
  description?: string,
}

type transactionData = {
  income: float,
  expense: float,
  transactions: array<transactionItem>,
}
