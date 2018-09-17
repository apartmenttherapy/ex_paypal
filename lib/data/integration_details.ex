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

  @type opts :: [{:rest_api_integration, RestAPIIntegration.t},
                 {:rest_third_party_details, RestAPIIntegration.t}]

  @doc """
  Create a `t:ExPaypal.Data.IntegrationDetails.t/0` struct

  ## Parameters

    - `partner_id`: The PayPal ID for the partner

  ## Examples

      iex> IntegrationDetails.new("joe@example.com")
      %IntegrationDetails{partner_id: "joe@example.com"}

  """
  @spec new(String.t) :: __MODULE__.t
  def new(partner_id) do
    struct(__MODULE__, partner_id: partner_id)
  end

  @doc """
  Create a `t:ExPaypal.Data.IntegrationDetails.t/0` struct with optional data

  ## Parameters

    - `partner_id`: The PayPal ID for the partner.
    - `opts`: The integration opts (`t:ExPaypal.Data.IntegrationDetails.opts/0`)

  ## Examples

      iex> IntegrationDetails.new("joe@example.com", rest_api_integration: api_integration)
      %IntegrationDetails{partner_id: "joe@example.com", rest_api_integration: %RestAPIIntegration{integration_method: :PAYPAL}}

  """
  @spec new(String.t, opts) :: __MODULE__.t
  def new(partner_id, opts) do
    parts = [partner_id: partner_id] ++ opts
    struct(__MODULE__, parts)
  end
end
