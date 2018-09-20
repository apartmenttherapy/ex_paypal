defmodule ExPaypal.Data.RestThirdPartyDetails do
  @moduledoc """
  The [`rest_third_party_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-rest_third_party_details) for PayPal.
  """

  defstruct [:partner_client_id, :feature_list]
  @type t :: %__MODULE__{partner_client_id: String.t,
                         feature_list: [feature]}

  @type feature :: :PAYMENT
                   | :REFUND
                   | :PARTNER_FEE
                   | :DELAY_FUNDS_DISBURSEMENT
                   | :SWEEP_FUNDS_EXTERNAL_SINK
                   | :READ_SELLER_DISPUTE
                   | :UPDATE_SELLER_DISPUTE
                   | :ADVANCED_TRANSACTIONS_SEARCH

  @doc """
  Create a `t:ExPaypal.Data.RestThirdPartyDetails.t/0` struct

  ## Parameters

    - `id`: The partner client ID for the integration
    - `features`: A list of features for the integration (`t:ExPaypal.Data.RestThirdPartyDetails.feature/0`)

  ## Examples

      iex> RestThirdPartyDetails.new("42", [:PAYMENT, :REFUND])
      %RestThirdPartyDetails{partner_client_id: "42", feature_list: [:PAYMENT, :REFUND]}

  """
  @spec new(String.t, [feature, ...]) :: __MODULE__.t
  def new(id, features) do
    struct(__MODULE__, partner_client_id: id, feature_list: features)
  end
end
