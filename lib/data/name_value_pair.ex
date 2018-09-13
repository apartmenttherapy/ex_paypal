defmodule ExPaypal.Data.NameValuePair do
  @moduledoc """
  The [`name_value_pair` object](https://developer.paypal.com/docs/api/orders/v1/#definition-name_value_pair) for PayPal
  """

  @enforce_keys [:name, :value]
  defstruct [:name, :value]
  @type t :: %__MODULE__{name: String.t, value: String.t}

  @doc """
  Creates a new `t:ExPaypal.Data.NameValuePair.t/0` struct

  ## Parameters

    - `name`: The name attribute for the pair
    - `value`: The value for the pair

  ## Examples

     iex> NameValuePair.new("key", "value")
     %NameValuePair{name: "key", value: "value"}

  """
  @spec new(String.t, String.t) :: __MODULE__.t
  def new(name, value) do
    struct(__MODULE__, name: name, value: value)
  end
end
