defmodule ExPaypal.Data.IntegrationDetailsTest do
  use ExUnit.Case

  alias ExPaypal.Data.{IntegrationDetails, RestAPIIntegration}
  doctest IntegrationDetails

  defp api_integration do
    %RestAPIIntegration{
      integration_method: :PAYPAL
    }
  end
end
