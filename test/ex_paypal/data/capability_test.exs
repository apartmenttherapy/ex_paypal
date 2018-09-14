defmodule ExPaypal.Data.CapabilityTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Capability, IntegrationDetails}
  doctest Capability

  def preference do
    %IntegrationDetails{
      partner_id: "joe@example.com"
    }
  end
end
