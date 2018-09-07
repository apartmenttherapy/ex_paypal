defmodule ExPaypal.Data.PayeeDisplayMetadata do
  @moduledoc """
  The [`payee_display_metadata` object](https://developer.paypal.com/docs/api/orders/v1/#definition-payee_display_metadata) for PayPal.
  """

  alias ExPaypal.Data.DisplayPhone

  defstruct [:email, :display_phone, :brand_name]
  @type t :: %__MODULE__{email: String.t,
                         display_phone: DisplayPhone.t,
                         brand_name: String.t}

  @type data :: [{:email, String.t},
                 {:display_phone, DisplayPhone.t},
                 {:brand_name, String.t}]

  @doc """
  Creates a new `t:ExPaypal.Data.PayeeDisplayMetadata.t/0` struct

  ## Parameters

    - `data`: The data for the `DisplayPhone` (`t:ExPaypal.Data.DisplayPhone.data/0`)

  ## Examples

      iex> PayeeDisplayMetadata.new(brand_name: "New to You")
      %PayeeDisplayMetadata{brand_name: "New to You"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
