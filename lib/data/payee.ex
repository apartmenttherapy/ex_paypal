defmodule ExPaypal.Data.Payee do
  @moduledoc """
  The [`payee` object](https://developer.paypal.com/docs/api/orders/v1/#definition-payee) for PayPal
  """

  alias ExPaypal.Data.PayeeDisplayMetadata

  defstruct [:email, :merchant_id, :payee_display_metadata]
  @type t :: %__MODULE__{email: String.t,
                         merchant_id: String.t,
                         payee_display_metadata: PayeeDisplayMetadata.t}

  @type data :: [{:email, String.t},
                 {:merchant_id, String.t},
                 {:payee_display_metadata, PayeeDisplayMetadata.t}]

  @doc """
  Creates a new `t:ExPaypal.Data.Payee.t/0` struct

  ## Parameters

    - `data`: The payee information (`t:ExPaypal.Data.Payee.data/0`)

  ## Examples

      iex> Payee.new(merchant_id: "42")
      %Payee{merchant_id: "42"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
