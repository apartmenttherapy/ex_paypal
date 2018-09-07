defmodule ExPaypal.Data.Address do
  @moduledoc """
  The [`address` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-address) for PayPal.
  """

  alias ExPaypal.Data.Validator

  @enforce_keys [:line1, :line2, :city, :country_code]
  defstruct [:line1, :line2, :city, :state, :country_code]
  @type t :: %__MODULE__{line1: String.t,
                         line2: String.t,
                         city: String.t,
                         state: String.t,
                         country_code: String.t
                        }

  @typep required_keys :: :line1 | :line2 | :city | :country_code

  @type data :: %{required(required_keys) => String.t,
                  optional(:state) => String.t
                 }

  @doc """
  Creates a new `t:ExPaypal.Data.Address.t/0` struct

  ## Parameters

    - `address_data`: The address data (`t:ExPaypal.Data.Address.data/0`)

  ## Examples

      iex> Address.new(line1: "42", line2: "Example Rd.", city: "Exampleville", country_code: "US")
      {:ok, %Address{line1: "42", line2: "Example Rd.", city: "Exampleville", country_code: "US"}}

      iex> Address.new(line1: "42")
      {:error, missing: [:city, :country_code, :line2]}

  """
  @spec new(data) :: {:ok, __MODULE__.t} | {:error, [missing: [atom]]}
  def new(address_data) do
    validator = Validator.new(required_keys())

    {parts, validator} = Enum.reduce(address_data, {%{}, validator}, fn {key, value}, {record, validator} ->
      {Map.put(record, key, value), Validator.process(key, validator)}
    end)

    case Validator.valid?(validator) do
      true ->
        {:ok, build_from(parts)}
      false ->
        missing = MapSet.to_list(validator.keys())
        {:error, missing: missing}
    end
  end

  defp required_keys do
    [
      :line1,
      :line2,
      :city,
      :country_code
    ]
  end

  defp build_from(parts) do
    data = Enum.reduce(parts, [], &build/2)

    struct(__MODULE__, data)
  end

  defp build(pair, addr) do
    [pair] ++ addr
  end
end
