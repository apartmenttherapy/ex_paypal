defmodule ExPaypal.Data.IntegrationDetails do
  @moduledoc """
  The [`integration_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-integration_details) for PayPal
  """

  alias ExPaypal.Data.{RestAPIIntegration, RestThirdPartyDetails}

  @partner_id Application.get_env(:ex_paypal, :partner_id)

  defstruct partner_id: @partner_id,
            rest_api_integration: nil,
            rest_third_party_details: nil
  @type t :: %__MODULE__{
               partner_id: String.t,
               rest_api_integration: RestAPIIntegration.t,
               rest_third_party_details: RestThirdPartyDetails.t
             }

  @type opts :: [{:rest_api_integration, RestAPIIntegration.t},
                 {:rest_third_party_details, RestThirdPartyDetails.t}]

  @doc """
  Create a `t:ExPaypal.Data.IntegrationDetails.t/0` struct with optional data

  ## Parameters

    - `opts`: The integration opts (`t:ExPaypal.Data.IntegrationDetails.opts/0`)

  ## Examples

      iex> IntegrationDetails.new(rest_api_integration: api_integration)
      %IntegrationDetails{partner_id: "joe@example.com", rest_api_integration: %RestAPIIntegration{integration_method: :PAYPAL}}

  """
  @spec new(opts) :: __MODULE__.t
  def new(opts) do
    struct(__MODULE__, opts)
  end
end
