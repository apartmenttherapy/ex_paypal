defmodule ExPaypal.Data.PartnerReferral do
  @moduledoc """
  The [partner referral](https://developer.paypal.com/docs/marketplaces/integrate/connected/upfront/#1-make-a-partner-referrals-api-call) payload for Upfront Onboarding with PayPal
  """

  alias ExPaypal.Data.{
                        BusinessDetails,
                        Capability,
                        LegalConsent,
                        ProductName,
                        WebExperiencePreference
                       }

  defstruct customer_data: %BusinessDetails{},
            requested_capabilities: [],
            web_experience_preference: %WebExperiencePreference{},
            collected_consents: [],
            products: []
  @type t :: %__MODULE__{
               customer_data: BusinessDetails.t,
               requested_capabilities: [Capability.t],
               web_experience_preference: WebExperiencePreference.t,
               collected_consents: [LegalConsent.t],
               products: [ProductName.t]
             }

  @type data :: [
                  {:customer_data, BusinessDetails.t},
                  {:request_capabilities, [Capability.t]},
                  {:web_experience_preference, WebExperiencePreference.t},
                  {:collected_consents, [LegalConsent.t]},
                  {:products, [ProductName.t]}
                ]

  @doc """
  Create a new `t:ExPaypal.Data.PartnerReferral.t/0` struct with the given data

  ## Parameters

    - `data`: The data to use in initializing the struct, this shuld be a Keyword list (`t:ExPaypal.Data.PartnerReferral.data/0`)

  ## Examples

      iex> PartnerReferral.new(customer_data: details)
      %PartnerReferral{customer_data: %BusinessDetails{}}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
