open Types

type expenseCategory = {
  label: string,
  isCredit: bool,
  icon: string,
}

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

let defaultTransactionData = {
  income: 0.0,
  expense: 0.0,
  transactions: [],
}
