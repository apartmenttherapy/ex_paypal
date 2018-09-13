defmodule ExPaypal.Data.PartnerSpecificIdentifier do
  @moduledoc """
  The [`partner_specific_identifier` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-partner_specific_identifier) for PayPal.
  """

  @enforce_keys [:type, :value]
  defstruct type: :TRACKING_ID, value: nil
  @type t :: %__MODULE__{type: :TRACKING_ID,
                         value: String.t}

  @doc """
  Create a `t:ExPaypal.Data.PartnerSpecificIdentifier.t/0` struct

  ## Parameters

    - `value`: Partner identifier value

  ## Examples

      iex> PartnerSpecificIdentifier.new("42")
      %PartnerSpecificIdentifier{type: :TRACKING_ID, value: "42"}

  """
  @spec new(String.t) :: __MODULE__.t
  def new(value) do
    struct(__MODULE__, value: value)
  end
end
