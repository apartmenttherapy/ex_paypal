defmodule ExPaypal.Data.Onboard do
  @moduledoc """
  The [onboarding request](https://developer.paypal.com/docs/marketplaces/integrate/connected/upfront/#1-make-a-partner-referrals-api-call) body for PayPal
  """

  alias ExPaypal.Data.{User,
                       Capability,
                       WebExperiencePreference,
                       LegalConsent,
                       ProductName}

  defstruct [:customer_data,
             :requested_capabilities,
             :web_experience_preference,
             :collected_consents,
             :products]
  @type t :: %__MODULE__{customer_data: nil | User.t,
                         requested_capabilities: nil | [Capability.t, ...],
                         web_experience_preference: nil | WebExperiencePreference.t,
                         collected_consents: nil | [LegalConsent.t, ...],
                         products: nil | [ProductName.value, ...]}

  @type data :: [{:customer_data, User.t},
                 {:requested_capabilities, [Capability.t, ...]},
                 {:web_experience_preference, WebExperiencePreference.t},
                 {:collected_consents, [LegalConsent.t, ...]},
                 {:products, [ProductName.value, ...]}]

  @doc """
  Create a `t:ExPaypal.Data.Onboard.t/0` struct

  ## Parameters

    - `data`: The data to initialize the struct with (`t:ExPaypal.Data.Onboard.data/0`)

  ## Examples

      iex> Onboard.new(products: [:EXPRESS_CHECKOUT])
      %Onboard{products: [:EXPRESS_CHECKOUT]}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
