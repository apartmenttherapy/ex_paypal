defmodule ExPaypal.Data.PartnerFeeDetails do
  @moduledoc """
  The [`partner_fee_details` object](https://developer.paypal.com/docs/api/orders/v1/#definition-partner_fee_details) for PayPal.
  """

  alias ExPaypal.Data.{Currency, Payee}

  @enforce_keys [:receiver, :amount]
  defstruct [:receiver, :amount]
  @type t :: %__MODULE__{receiver: Payee.t, amount: Currency.t}

  @doc """
  Creates a new `t:ExPaypal.Data.PartnerFeeDetails.t/0` struct

  ## Parameters

    - `receiver`: The `t:ExPaypal.Data.Payee.t/0` struct for the receiver of the fee
    - `amount`: The `t:ExPaypal.Data.Currency.t/0` struct representing the amount of the fee

  ## Examples

      iex> PartnerFeeDetails.new(receiver, amount)
      %PartnerFeeDetails{receiver: %Payee{}, amount: %Currency{currency: "USD", value: "0.50"}}

  """
  @spec new(Payee.t, Currency.t) :: __MODULE__.t
  def new(receiver, amount) do
    struct(__MODULE__, receiver: receiver, amount: amount)
  end
end
