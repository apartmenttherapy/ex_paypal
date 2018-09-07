defmodule ExPaypal.Data.BillingAgreement do
  @moduledoc """
  The [`billing_agreement` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-billing_agreement) for PayPal
  """

  alias ExPaypal.Data.BillingExperiencePreference

  defstruct [:description, :billing_experience_preference, :merchant_custom_data, :approval_url, :ec_token]
  @type t :: %__MODULE__{
               description: String.t,
               billing_experience_preference: BillingExperiencePreference.t,
               merchant_custom_data: String.t,
               ec_token: String.t
             }
end
