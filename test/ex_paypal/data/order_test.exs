defmodule ExPaypal.Data.OrderTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Amount,
                       Order,
                       PurchaseUnit,
                       RedirectUrls}
  doctest Order

  defp unit1 do
    %PurchaseUnit{
      reference_id: "42",
      amount: %Amount{
        currency: "USD",
        total: "400.00"
      }
    }
  end

  defp unit2 do
    %PurchaseUnit{
      reference_id: "43",
      amount: %Amount{
        currency: "USD",
        total: "500.00"
      }
    }
  end
end
