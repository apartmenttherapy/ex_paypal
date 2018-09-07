defmodule ExPaypal.Data.PhoneDetails do
  @moduledoc """
  A [`phone_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-phone_details) for PayPal
  """

  alias ExPaypal.Data.Phone

  defstruct [:phone_number, :phone_type]
  @type t :: %__MODULE__{
               phone_number: Phone.t,
               phone_type: number_type
             }

  @type number_type :: :FAX
                       | :HOME
                       | :MOBILE
                       | :OTHER
                       | :PAGER

  @type data :: Phone.data | Phone.t

  @doc """
  Creates a new `t:ExPaypal.Data.PhoneDetails.t/0` struct

  ## Parameters

    - `number`: The phone number, either as a `t:ExPaypal.Data.Phone.data/0` or `t:ExPaypal.Data.Phone.t/0` type.
    - `type`: The type of the phone number (`t:ExPaypal.Data.number_type/0`)

  ## Examples

    iex> PhoneDetails.new({"1", "2223334444"}, :HOME)
    %PhoneDetails{phone_number: %Phone{country_code: "1", national_number: "2223334444"}, phone_type: :HOME}

  """
  @spec new(data, number_type) :: __MODULE__.t
  def new(%_{} = number, type) do
    %__MODULE__{phone_number: number, phone_type: type}
  end
  def new(number, type) do
    %__MODULE__{phone_number: Phone.new(number), phone_type: type}
  end
end
