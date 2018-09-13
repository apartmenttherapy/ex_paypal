defmodule ExPaypal.Data.Identifier do
  @moduledoc """
  The [`identifier` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-identifier) for PayPal.
  """

  defstruct [:type, :value]
  @type t :: %__MODULE__{type: nil | id_type,
                         value: nil | String.t}

  @type id_type :: :ROUTING_NUMBER_1
                   | :ROUTING_NUMBER_2
                   | :ROUTING_NUMBER_3
                   | :BI_CODE
                   | :BANK_CODE
                   | :BRANCH_CODE
                   | :INTERMEDIARY_SWIFT_CODE
                   | :BBAN
                   | :BBAN_ENCRYPTED
                   | :BBAN_HMAC
                   | :AGGREGATOR_YODLEE

  @doc """
  Create a `t:ExPaypal.Data.Identifier.t/0` struct

  ## Parameters

    - `type`: The identifier type (`t:ExPaypal.Data.Identifier.id_type/0`)
    - `value`: The actual identifier

  ## Examples

      iex> Identifier.new(:BANK_CODE, "385385748538")
      %Identifier{type: :BANK_CODE, value: "385385748538"}

  """
  @spec new(id_type, String.t) :: __MODULE__.t
  def new(type, value) do
    struct(__MODULE__, type: type, value: value)
  end
end
