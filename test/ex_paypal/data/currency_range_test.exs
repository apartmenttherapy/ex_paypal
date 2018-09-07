defmodule ExPaypal.Data.CurrencyRangeTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Currency, CurrencyRange}
  doctest CurrencyRange

  defp min_value, do: %Currency{currency: "USD", value: "300"}
  defp max_value, do: %Currency{currency: "USD", value: "3000"}
  defp dollars, do: %Currency{currency: "USD", value: "300"}
  defp pounds, do: %Currency{currency: "GBP", value: "3000"}
end
