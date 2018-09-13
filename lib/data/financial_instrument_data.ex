defmodule ExPaypal.Data.FinancialInstrumentData do
  @moduledoc """
  The [`financial_instrument_data` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-financial_instrument_data) for PayPal.
  """

  alias ExPaypal.Data.BankDetails

  defstruct [:bank_details]
  @type t :: %__MODULE__{bank_details: nil | [BankDetails.t, ...]}

  @doc """
  Create a `t:ExPaypal.Data.BankDetails.t/0` struct

  ## Parameters

    - `bank_details`: A list of `t:ExPaypal.Data.BankDetails.t/0` structs

  ## Examples

      iex> FinancialInstrumentData.new([bank_details])
      %FinancialInstrumentData{bank_details: [%BankDetails{account_number: "42", account_type: :CHECKING}]}

  """
  @spec new([BankDetails.t, ...]) :: __MODULE__.t
  def new(bank_details) do
    struct(__MODULE__, bank_details: bank_details)
  end
end
