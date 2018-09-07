defmodule ExPaypal.Data.Amount do
  @moduledoc """
  The [`amount` object](https://developer.paypal.com/docs/api/orders/v1/#definition-amount) for PayPal.
  """

  @enforce_keys [:currency, :total]
  defstruct [:currency, :total, :details]
  @type t :: %__MODULE__{currency: String.t,
                         total: String.t,
                         details: Details.t}

  @type data :: [{:currency, String.t},
                 {:total, String.t},
                 {:details, Details.t}]

  @doc """
  Create a new `t:ExPaypal.Data.Amount.t/0` struct

  ## Parameters

    - `data`: The data for the `Amount` (`t:ExPaypal.Data.Amount.data/0`)

  ## Examples

      iex> Amount.new(currency: "USD", total: "42.42")
      %Amount{currency: "USD", total: "42.42"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
