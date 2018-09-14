defmodule ExPaypal.Data.Capability do
  @moduledoc """
  The [`capability` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-capability) for PayPal
  """

  alias ExPaypal.Data.{BillingAgreement, IntegrationDetails}

  defstruct [:capability, :api_integration_preference, :billing_agreement]
  @type t :: %__MODULE__{
               capability: capability,
               api_integration_preference: IntegrationDetails.t,
               billing_agreement: BillingAgreement.t
             }

  @type capability :: :API_INTEGRATION
                      | :BANK_ADDITION
                      | :BILLING_AGREEMENT
                      | :CONTEXTUAL_MARKETING_CONSENT

  @type data :: [{:capability, capability},
                 {:api_integration_preference, IntegrationDetails.t},
                 {:billing_agreement, BillingAgreement.t}]

  @doc """
  Create a `t:ExPaypal.Data.Capability.t/0` struct

  ## Parameters

    - `data`: The capability data (`t:ExPaypal.Data.Capability.data/0`)

  ## Examples

      iex> Capability.new(capability: :API_INTEGRATION, api_integration_preference: preference)
      %Capability{capability: :API_INTEGRATION, api_integration_preference: %IntegrationDetails{partner_id: "joe@example.com"}}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
