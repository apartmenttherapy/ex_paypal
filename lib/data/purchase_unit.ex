defmodule ExPaypal.Data.PurchaseUnit do
  @moduledoc """
  The [`purchase_unit` object](https://developer.paypal.com/docs/api/orders/v1/#definition-purchase_unit) for PayPal.
  """

  alias ExPaypal.Data.{Amount,
                       Item,
                       Metadata,
                       PartnerFeeDetails,
                       Payee,
                       PaymentSummary,
                       ShippingAddress}

  @enforce_keys [:reference_id, :amount]
  defstruct [:reference_id, :amount, :payee, :description, :custom, :invoice_number, :payment_descriptor, :items, :notify_url, :shipping_address, :shipping_method, :partner_fee_details, :payment_linked_group, :metadata, :payment_summary, :status, :reason_code]
  @type t :: %__MODULE__{reference_id: String.t,
                         amount: Amount.t,
                         payee: Payee.t,
                         description: String.t,
                         custom: String.t,
                         invoice_number: String.t,
                         payment_descriptor: String.t,
                         items: [Item.t],
                         notify_url: String.t,
                         shipping_address: ShippingAddress.t,
                         shipping_method: String.t,
                         partner_fee_details: PartnerFeeDetails.t,
                         payment_linked_group: integer,
                         metadata: Metadata.t,
                         payment_summary: PaymentSummary.t,
                         status: status,
                         reason_code: reason}

  @type opts :: [{:payee, Payee.t},
                 {:description, String.t},
                 {:custom, String.t},
                 {:invoice_number, String.t},
                 {:payment_descriptor, String.t},
                 {:items, [Item.t]},
                 {:notify_url, String.t},
                 {:shipping_address, ShippingAddress.t},
                 {:shipping_method, String.t},
                 {:partner_fee_details, PartnerFeeDetails.t},
                 {:payment_linked_group, integer},
                 {:metadata, Metadata.t},
                 {:payment_summary, PaymentSummary.t},
                 {:status, status},
                 {:reason_code, reason}]

  @type status :: :NOT_PROCESSED
                  | :PENDING
                  | :VOIDED
                  | :AUTHORIZED
                  | :CAPTURED

  @type reason :: :PAYER_SHIPPING_UNCONFIRMED
                  | :MULTI_CURRENCY
                  | :RISK_REVIEW
                  | :REGULATORY_REVIEW
                  | :VERIFICATION_REQUIRED
                  | :ORDER
                  | :OTHER
                  | :DECLINED_BY_POLICY

  @doc """
  Creates a new `t:ExPaypal.Data.PurchaseUnit.t/0` struct

  ## Parameters

    - `reference_id`: The Merchant ID for the _Purchase Unit_
    - `amount`: The `t:ExPaypal.Data.Amount.t/0` struct for the _Purchase Unit_

  ## Examples

      iex> PurchaseUnit.new("42", amount)
      %PurchaseUnit{reference_id: "42", amount: %Amount{currency: "USD", total: "400.00"}}

  """
  @spec new(String.t, Amount.t) :: __MODULE__.t
  def new(reference_id, amount) do
    struct(__MODULE__, reference_id: reference_id, amount: amount)
  end

  @doc """
  Creates a new `t:ExPaypal.Data.PurchaseUnit.t/0` struct with optional values

  ## Parameters

    - `reference_id`: The Merchant ID for the _Purchase Unit_
    - `amount`: The `t:ExPaypal.Data.Amount.t/0` struct for the _Purchase Unit_
    - `opts`: Optional data for the _Purchase Unit_

  ## Examples

      iex> PurchaseUnit.new("42", amount, payment_linked_group: 42)
      %PurchaseUnit{reference_id: "42", amount: %Amount{currency: "USD", total: "400.00"}, payment_linked_group: 42}

  """
  @spec new(String.t, Amount.t, opts) :: __MODULE__.t
  def new(reference_id, amount, opts) do
    parts = [reference_id: reference_id, amount: amount] ++ opts

    struct(__MODULE__, parts)
  end
end
