defmodule ExPaypal.Data.Currency do
  @moduledoc """
  The [`currency` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-currency) for PayPal
  """

  @enforce_keys [:currency, :value]
  defstruct [:currency, :value]
  @type t :: %__MODULE__{currency: String.t, value: String.t}

  @doc """
  Create a new `t:ExPaypal.Data.Currency.t/0` record.

  ## Parameters

    - `type`: The currency type
    - `amount`: The amount of the given currency

  ## Examples

      iex> Currency.new("USD", "500")
      %Currency{currency: "USD", value: "500"}

  """
  @spec new(String.t, String.t) :: __MODULE__.t
  def new(type, amount) do
    struct(__MODULE__, currency: type, value: amount)
  end
end
