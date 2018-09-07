defmodule ExPaypal.Data.CountryCode do
  @moduledoc """
  The [`country_code` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-country_code) for PayPal.
  """

  defstruct [:country_code]
  @type t :: %__MODULE__{country_code: String.t}
  @type length_error :: {:error, :country_code_too_long | :country_code_too_short}

  @doc """
  Creates a new `t:ExPaypal.Data.CountryCode.t/0` record.

  ## Parameters

    - `code`: The country code

  ## Examples

      iex> CountryCode.new("US")
      {:ok, %CountryCode{country_code: "US"}}

  """
  @spec new(String.t) :: {:ok, __MODULE__.t} | length_error
  def new(code) when byte_size(code) > 2, do: {:error, :country_code_too_long}
  def new(code) when byte_size(code) < 2, do: {:error, :country_code_too_short}
  def new(code) do
    {:ok, struct(__MODULE__, country_code: code)}
  end
end
