defmodule ExPaypal.Data.Details do
  @moduledoc """
  The [`details` object](https://developer.paypal.com/docs/api/orders/v1/#definition-details) for PayPal.
  """

  defstruct [:subtotal,
             :shipping,
             :tax,
             :handling_fee,
             :shipping_discount,
             :insurance,
             :gift_wrap]
  @type t :: %__MODULE__{subtotal: String.t,
                         shipping: String.t,
                         tax: String.t,
                         handling_fee: String.t,
                         shipping_discount: String.t,
                         insurance: String.t,
                         gift_wrap: String.t}

  @type data :: [{:subtotal, String.t},
                 {:shipping, String.t},
                 {:tax, String.t},
                 {:handling_fee, String.t},
                 {:shipping_discount, String.t},
                 {:insurance, String.t},
                 {:gift_wrap, String.t}]

  @doc """
  Creates a new `t:ExPaypal.Data.Details.t/0` struct

  ## Parameters

    - `data`: The Details data (`t:ExPaypal.Data.Details.data/0`)

  ## Examples

      iex> Details.new(subtotal: "42.42", shipping: "300")
      %Details{subtotal: "42.42", shipping: "300"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
