defmodule ExPaypal.Data.FinancialInstrumentDataTest do
  use ExUnit.Case

  alias ExPaypal.Data.{BankDetails, FinancialInstrumentData}
  doctest FinancialInstrumentData

  defp bank_details do
    %BankDetails{
      account_number: "42",
      account_type: :CHECKING
    }
  end
end
