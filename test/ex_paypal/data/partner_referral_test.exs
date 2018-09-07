defmodule ExPaypal.Data.PartnerReferralTest do
  use ExUnit.Case

  alias ExPaypal.Data.{BusinessDetails, PartnerReferral}
  doctest PartnerReferral

  defp details do
    %BusinessDetails{}
  end
end
