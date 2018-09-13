defmodule ExPaypal.Data.PaymentSummary do
  @moduledoc """
  The [`payment_summary` object](https://developer.paypal.com/docs/api/orders/v1/#definition-payment_summary) for PayPal
  """

  defstruct captures: [], refunds: [], sales: [], authorizations: []
  @type t :: %__MODULE__{captures: [Capture.t],
                         refunds: [Refund.t],
                         sales: [Sale.t],
                         authorizations: [Sale.t]}

  @type data :: [{:captures, [Capture.t]},
                 {:refunds, [Refund.t]},
                 {:sales, [Sale.t]},
                 {:authorization, [Sale.t]}]

  @doc """
  Creates a `t:ExPaypal.Data.PaymentSummary.t/0` struct

  ## Parameters

    - `data`: The data for the `Payment Summary` (`t:ExPaypal.Data.PaymentSummary.data/0`)

  ## Examples

      iex> PaymentSummary.new(captures: [%Capture{}, %Capture{}])
      %PaymentSummary{captures: [%Capture{}, %Capture{}]}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
