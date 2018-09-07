defmodule ExPaypal.Data.LegalConsent do
  @moduledoc """
  The [`legal_consent` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-legal_consent) for PayPal
  """

  @enforce_keys [:type, :granted]
  defstruct type: :SHARE_DATA_CONSENT, granted: false
  @type t :: %__MODULE__{
               type: type,
               granted: boolean
             }

  @type type :: :SHARE_DATA_CONSENT

  @doc """
  Create a `t:ExPaypal.Data.LegalConsent.t/0` struct

  ## Parameters

    - `granted`: Whether the consent has been granted or not

  ## Examples

      iex> LegalConsent.new(true)
      %LegalConsent{type: :SHARE_DATA_CONSENT, granted: true}

      iex> LegalConsent.new(false)
      %LegalConsent{type: :SHARE_DATA_CONSENT, granted: false}

  """
  @spec new(boolean) :: __MODULE__.t
  def new(granted) do
    struct(__MODULE__, granted: granted)
  end
end
