defmodule ExPaypal.Data.DisplayPhone do
  @moduledoc """
  The [`display_phone` object](https://developer.paypal.com/docs/api/orders/v1/#definition-display_phone) for PayPal.
  """

  defstruct [:country_code, :number]
  @type t :: %__MODULE__{country_code: String.t, number: String.t}

  @doc """
  Create a new `t:ExPaypal.Data.DisplayPhone.t/0` struct

  ## Parameters

    - `cc`: The [country code](https://developer.paypal.com/docs/integration/direct/rest/country-codes/#) for the number
    - `number`: The phone number ([E.164 format](https://www.itu.int/rec/T-REC-E.164-201011-I))

  ## Examples

      iex> DisplayPhone.new("US", "15555555555")
      %DisplayPhone{country_code: "US", number: "15555555555"}

  """
  @spec new(String.t, String.t) :: __MODULE__.t
  def new(cc, number) do
    struct(__MODULE__, country_code: cc, number: number)
  end
end
