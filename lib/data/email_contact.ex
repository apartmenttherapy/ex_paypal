defmodule ExPaypal.Data.EmailContact do
  @moduledoc """
  The [`email_contact` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-email_contact) for PayPal
  """

  alias ExPaypal.Data.EmailAddress

  @enforce_keys [:email_address, :role]
  defstruct email_address: nil, role: :CUSTOMER_SERVICE
  @type t :: %__MODULE__{email_address: EmailAddress.t, role: :CUSTOMER_SERVICE}

  @doc """
  Creates a new `t:ExPaypal.Data.EmailContact.t/0` record.

  ## Parameters

    - `address`: The email address for the contact

  ## Examples

      iex> EmailContact.new("if@example.com")
      {:ok, %EmailContact{email_address: %EmailAddress{email_address: "if@example.com"}, role: :CUSTOMER_SERVICE}}

  """
  @spec new(String.t) :: {:ok, __MODULE__.t} | {:error, any}
  def new(address) do
    case EmailAddress.new(address) do
      {:ok, address} ->
        {:ok, struct(__MODULE__, email_address: address)}
      error ->
        error
    end
  end
end
