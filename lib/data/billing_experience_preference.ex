defmodule ExPaypal.Data.BillingExperiencePreference do
  @moduledoc """
  The [`billing_experience_preference` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-billing_experience_preference) for PayPal
  """

  defstruct [:experience_id, :billing_context_set]
  @type t :: %__MODULE__{
               experience_id: String.t,
               billing_context_set: boolean
             }

  @doc """
  Creates a `t:ExPaypal.Data.BillingExperiencePreference.t/0` struct

  ## Parameters

    - `id`: The "payment web experience profile ID"
    - `displayed`: Flag indicating whether the context has already been displayed to the seller

  ## Examples

      iex> BillingExperiencePreference.new("42", true)
      %BillingExperiencePreference{experience_id: "42", billing_context_set: true}

  """
  @spec new(String.t, boolean) :: __MODULE__.t
  def new(id, displayed) do
    %__MODULE__{experience_id: id, billing_context_set: displayed}
  end
end
