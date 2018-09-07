defmodule ExPaypal.Data.IntegrationDetails do
  @moduledoc """
  The [`integration_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-integration_details) for PayPal
  """

  alias ExPaypal.Data.RestAPIIntegration

  defstruct [:partner_id, :rest_api_integration, :rest_third_party_details]
  @type t :: %__MODULE__{
               partner_id: String.t,
               rest_api_integration: RestAPIIntegration.t,
               rest_third_party_details: RestAPIIntegration.t
             }
end
