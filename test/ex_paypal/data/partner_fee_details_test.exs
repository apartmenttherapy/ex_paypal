defmodule ExPaypal.Data.PartnerFeeDetailsTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Currency, PartnerFeeDetails, Payee}
  doctest PartnerFeeDetails

  defp receiver do
    %Payee{}
  end

  defp amount do
    %Currency{currency: "USD", value: "0.50"}
  end
end
