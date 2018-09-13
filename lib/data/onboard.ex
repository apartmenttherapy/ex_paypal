defmodule ExPaypal.Data.Onboard do
  @moduledoc """
  The [onboarding request](https://developer.paypal.com/docs/marketplaces/integrate/connected/upfront/#1-make-a-partner-referrals-api-call) body for PayPal
  """

  defstruct [:customer_data, :requested_capabilities, :web_experience_preference, :collected_consents, :products]
end
