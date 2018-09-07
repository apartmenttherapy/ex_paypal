defmodule ExPaypal.Data.AccountIdentifier do
  @moduledoc """
  Native implementation of the PayPal [`account_identifier` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-account_identifier)
  """

  @enforce_keys [:value]
  defstruct type: "PAYER_ID", value: nil
  @type t :: %__MODULE__{type: String.t, value: String.t}

  @doc """
  Create a new Account Identifier

  ## Parameters

    - `value`: The Account Identifier value.

  ## Examples

      iex> AccountIdentifier.new("bob")
      %AccountIdentifier{type: "PAYER_ID", value: "bob"}

  """
  @spec new(String.t) :: __MODULE__.t
  def new(value) do
    struct(__MODULE__, value: value)
  end
end
