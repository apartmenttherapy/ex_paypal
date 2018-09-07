defmodule ExPaypal.Data.Phone do
  @moduledoc """
  The [`phone` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-phone) for PayPal
  """

  defstruct [:country_code, :national_number, :extension_number]
  @type t :: %__MODULE__{
               country_code: String.t,
               national_number: String.t,
               extension_number: String.t
             }

  @type data :: {String.t, String.t} | {String.t, String.t, String.t}

  @doc """
  Create a new `t:ExPaypal.Data.Phone.t/0` struct

  ## Parameters

    - `number_data`: The phone number parts (`t:ExPaypal.Data.Phone.data/0`)

  ## Examples

      iex> Phone.new({"1", "5555555555"})
      %Phone{country_code: "1", national_number: "5555555555"}

      iex> Phone.new({"1", "5555555555", "231"})
      %Phone{country_code: "1", national_number: "5555555555", extension_number: "231"}

  """
  @spec new(data) :: __MODULE__.t
  def new({country_code, number}) do
    %__MODULE__{country_code: country_code, national_number: number}
  end
  def new({country_code, number, ext}) do
    %__MODULE__{country_code: country_code, national_number: number, extension_number: ext}
  end
end
