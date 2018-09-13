defmodule ExPaypal.Data.BankDetails do
  @moduledoc """
  The [`bank_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-bank_details) from PayPal.
  """

  alias ExPaypal.Data.Identifier

  @enforce_keys [:account_number, :account_type]
  defstruct [:nick_name,
             :account_number,
             :account_type,
             :currency_code,
             :identifiers,
             :branch_location,
             :mandate_agreed]
  @type t :: %__MODULE__{nick_name: nil | String.t,
                         account_number: nil | String.t,
                         account_type: nil | account_type,
                         currency_code: nil | String.t,
                         identifiers: nil | [Identifier.t, ...],
                         branch_location: nil | Address.t,
                         mandate_agreed: nil | boolean}

  @type account_type :: :CHECKING | :SAVINGS

  @type opts :: [{:nick_name, String.t},
                 {:currency_code, String.t},
                 {:identifiers, [Identifier.t, ...]},
                 {:branch_location, Address.t},
                 {:mandate_agreed, boolean}]

  @doc """
  Create a `t:ExPaypal.Data.BankDetails.t/0` struct

  ## Parameters

    - `account_number`: The bank account number
    - `account_type`: The bank accoun ttype (`t:ExPaypal.Data.BankDetails.account_type/0`)

  ## Examples

      iex> BankDetails.new("42", :SAVINGS)
      %BankDetails{account_number: "42", account_type: :SAVINGS}

  """
  @spec new(String.t, account_type) :: __MODULE__.t
  def new(account_number, account_type) do
    struct(__MODULE__, account_number: account_number, account_type: account_type)
  end

  @doc """
  Create a `t:ExPaypal.Data.BankDetails.t/0` struct with optional data

  ## Parameters

    - `account_number`: The bank account number
    - `account_type`: The bank account type (`t:ExPaypal.Data.BankDetails.account_type/0`)
    - `opts`: Optional extra account information (`t:ExPaypal.Data.BankDetails.opts/0`)

  ## Examples

      iex> BankDetails.new("42", :CHECKING, nick_name: "Personal")
      %BankDetails{account_number: "42", account_type: :CHECKING, nick_name: "Personal"}

  """
  @spec new(String.t, account_type, opts) :: __MODULE__.t
  def new(account_number, account_type, opts) do
    parts = [account_number: account_number, account_type: account_type] ++ opts

    struct(__MODULE__, parts)
  end
end
