defmodule ExPaypal.Data.EmailAddress do
  @moduledoc """
  The [`email_address` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-email_address) for PayPal
  """

  @enforce_keys [:email_address]
  defstruct [:email_address]
  @type t :: %__MODULE__{email_address: String.t}
  @type validation_error :: {:error, :address_too_short | :address_too_long}

  @doc """
  Create a new `t:ExPaypal.Data.EmailAddress.t/0` record.  This function performs some validation in line with PayPal's "requirements" for an email address.  If the address is valid it returns `{:ok, %EmailAddress{}}` if the address is invalid `{:error, :address_too_short}` or `{:error, :address_too_long}`.

  ## Parameters

    - `address`: The email address

  ## Examples

      iex> EmailAddress.new("if@example.com")
      {:ok, %EmailAddress{email_address: "if@example.com"}}

      iex> EmailAddress.new("a@")
      {:error, :address_too_short}

      iex> EmailAddress.new(really_long_address)
      {:error, :address_too_long}

  """
  @spec new(String.t) :: {:ok, __MODULE__.t} | validation_error
  def new(address) when byte_size(address) < 3, do: {:error, :address_too_short}
  def new(address) when byte_size(address) > 254, do: {:error, :address_too_long}
  def new(address) do
    {:ok, struct(__MODULE__, email_address: address)}
  end
end
