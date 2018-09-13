defmodule ExPaypal.Data.Capture do
  @moduledoc """
  The [`capture` object](https://developer.paypal.com/docs/api/orders/v1/#definition-capture) for PayPal.
  """

  defstruct [:id, :amount, :status, :reason_code, :transaction_fee, :links]
  @type t :: %__MODULE__{id: String.t,
                         amount: Amount.t,
                         status: status,
                         reason_code: reason,
                         transaction_fee: Currency.t,
                         links: [LinkDescription.t]}

  @type status :: :PENDING
                  | :COMPLETED
                  | :REFUNDED
                  | :PARTIALLY_REFUNDED
                  | :DENIED

  @type reason :: :CHARGEBACK
                  | :GUARANTEE
                  | :BUYER_COMPLAINT
                  | :REFUND
                  | :UNCONFIRMED_SHIPPING_ADDRESS
                  | :ECHECK
                  | :INTERNATIONAL_WITHDRAWAL
                  | :RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION
                  | :PAYMENT_REVIEW
                  | :REGULATORY_REVIEW
                  | :UNILATERAL
                  | :VERIFICATION_REQUIRED
                  | :DELAYED_DISBURSEMENT

  @type data :: [{:id, String.t},
                 {:amount, Amount.t},
                 {:status, status},
                 {:reason_code, reason},
                 {:transaction_fee, Currency.t},
                 {:links, [LinkDescription.t]}]

  @doc """
  Creates a new `t:ExPaypal.Data.Capture.t/0` struct

  ## Parameters

    - `data`: The data for the `Capture` struct (`t:ExPaypal.Data.Capture.data/0`)

  ## Examples

      iex> Capture.new(id: "42", status: :PENDING)
      %Capture{id: "42", status: :PENDING}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
