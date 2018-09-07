defmodule ExPaypal.Data.WebExperiencePreference do
  @moduledoc """
  The [`web_experience_preference` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-web_experience_preference) for PayPal
  """

  defstruct [:partner_logo_url, :return_url, :return_url_description, :action_renewal_url, :show_add_credit_card, :show_mobile_confirm, :use_mini_browser, :use_hua_email_confirmation]
  @type t :: %__MODULE__{
               partner_logo_url: String.t,
               return_url: String.t,
               return_url_description: String.t,
               action_renewal_url: String.t,
               show_add_credit_card: boolean,
               show_mobile_confirm: boolean,
               use_mini_browser: boolean,
               use_hua_email_confirmation: boolean
             }
end
