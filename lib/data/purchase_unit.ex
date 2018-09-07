defmodule ExPaypal.Data.PurchaseUnit do
  @moduledoc """
  The [`purchase_unit` object](https://developer.paypal.com/docs/api/orders/v1/#definition-purchase_unit) for PayPal.
  """

  @enforce_keys [:reference_id, :amount]
  defstruct [:reference_id, :amount, :payee, :description, :custom, :invoice_number, :payment_descriptor, :items, :notify_url, :shipping_address, :shipping_method, :partner_fee_details, :payment_linked_group, :metadata, :payment_summary, :status, :reason_code]
end
