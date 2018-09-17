defmodule ExPaypal.Data.Amount do
  @moduledoc """
  The [`amount` object](https://developer.paypal.com/docs/api/orders/v1/#definition-amount) for PayPal.
  """

  alias ExPaypal.Data.Details

  @enforce_keys [:currency, :total]
  defstruct [:currency, :total, :details]
  @type t :: %__MODULE__{currency: String.t,
                         total: String.t,
                         details: Details.t}

  @doc """
  Create a `t:ExPaypal.Data.Amount.t/0` struct

  ## Parameters

    - `total`: The value for the amount, ex: `"42.42"`
    - `currency`: The currency for the amount, ex: `"USD"`

  ## Examples

      iex> Amount.new("42.42", "USD")
      %Amount{currency: "USD", total: "42.42"}

  """
  @spec new(String.t, String.t) :: __MODULE__.t
  def new(total, currency) do
    struct(__MODULE__, total: total, currency: currency)
  end

  @doc """
  Create a `t:ExPaypal.Data.Amount.t/0` struct with `details`

  ## Parameters

    - `total`: The value for the amount, ex: `"42.42"`
    - `currency`: The currency for the amount, ex: `"USD"`
    - `details`: Optional details about the amount (`t:ExPaypal.Data.Details.t/0`)

  ## Examples

      iex> Amount.new("42.42", "USD", %Details{})
      %Amount{currency: "USD", total: "42.42", details: %Details{}}

  """
  @spec new(String.t, String.t, Details.t) :: __MODULE__.t
  def new(total, currency, details) do
    parts = [currency: currency, total: total, details: details]
    struct(__MODULE__, parts)
  end
end
