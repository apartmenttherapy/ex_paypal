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
end
