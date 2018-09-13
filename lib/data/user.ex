defmodule ExPaypal.Data.User do
  @moduledoc """
  The [`user` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-user) for PayPal.
  """

  alias ExPaypal.Data.{PersonDetails}

  defstruct [:customer_type,
             :person_details,
             :business_details,
             :financial_instrument_data,
             :preferred_language_code,
             :primary_currency_code,
             :referral_user_payer_id,
             :partner_specific_identifiers]
  @type t :: %__MODULE__{customer_type: role,
                         person_details: PersonDetails.t,
                         business_details: BusinessDetails.t,
                         financial_instrument_data: FinancialInstrumentData.t,
                         preferred_language_code: String.t,
                         primary_currency_code: String.t,
                         referral_user_payer_id: AccountIdentifier.t,
                         partner_specific_identifiers: PartnerSpecificIdentifier.t}

  @type role :: :CONSUMER | :MERCHANT

  @type data :: [{:customer_type, role},
                 {:person_details, PersonDetails.t},
                 {:business_details, BusinessDetails.t},
                 {:financial_instrument_data, FinancialInstrumentData.t},
                 {:preferred_language_code, String.t},
                 {:primary_currency_code, String.t},
                 {:referral_user_payer_id, AccountIdentifier.t},
                 {:partner_specific_identifiers, PartnerSpecificIdentifier.t}]

  @doc """
  Create a `t:ExPaypal.Data.User.t/0` struct

  ## Parameters

    - `data`: The data for the user (`t:ExPaypal.Data.User.data/0`)

  ## Examples

      iex> User.new(customer_type: :CONSUMER, primary_currency_code: "USD")
      %User{customer_type: :CONSUMER, primary_currency_code: "USD"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
