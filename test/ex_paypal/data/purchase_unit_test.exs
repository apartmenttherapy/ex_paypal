defmodule ExPaypal.Data.PurchaseUnitTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Amount,
                       Item,
                       Metadata,
                       PartnerFeeDetails,
                       Payee,
                       PaymentSummary,
                       ShippingAddress}

  alias ExPaypal.Data.PurchaseUnit
  doctest PurchaseUnit

  defp amount do
    %Amount{
      currency: "USD",
      total: "400.00"
    }
  end
end
