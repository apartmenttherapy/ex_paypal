defmodule ExPaypal.Data.CurrencyRange do
  @moduledoc """
  The [`currency_range` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-currency_range) for PayPal
  """

  alias ExPaypal.Data.Currency

  @enforce_keys [:minimum_amount, :maximum_amount]
  defstruct [:minimum_amount, :maximum_amount]
  @type t :: %__MODULE__{minimum_amount: Currency.t, maximum_amount: Currency.t}

  @doc """
  Creates a new `t:ExPaypal.Data.CurrencyRange.t/0` record.  If the range is valid this function will return {:ok, %CurrencyRange{}}.  If the range is negative then this function will return {:error, :negative_range}.  If the currencies don't match this function returns {:error, :currency_mismatch}

  ## Parameters

    - `min`: The minimum for the range (`t:ExPaypal.Data.Currency.t/0`)
    - `max`: The maximum for the range (`t:ExPaypal.Data.Currency.t/0`)

  ## Examples

      iex> CurrencyRange.new(min_value, max_value)
      {:ok, %CurrencyRange{minimum_amount: min_value, maximum_amount: max_value}}

      iex> CurrencyRange.new(max_value, min_value)
      {:error, :negative_range}

      iex> CurrencyRange.new(dollars, pounds)
      {:error, :currency_mismatch}

  """
  @spec new(Currency.t, Currency.t) :: {:ok, __MODULE__.t}
                                       | {:error, :negative_range}
                                       | {:error, :currency_mismatch}
  def new(min, max) do
    with true <- (min.value() < max.value()) || :negative_range,
         true <- (min.currency() == max.currency()) || :currency_mismatch
    do
      {:ok, struct(__MODULE__, minimum_amount: min, maximum_amount: max)}
    else
      problem -> {:error, problem}
    end
  end
end
