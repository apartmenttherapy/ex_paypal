defmodule ExPaypal.Data.Metadata do
  @moduledoc """
  The [`metadata` object](https://developer.paypal.com/docs/api/orders/v1/#definition-metadata) for PayPal
  """

  alias ExPaypal.Data.NameValuePair

  defstruct supplementary_data: []
  @type t :: %__MODULE__{supplementary_data: [NameValuePair.t]}

  @doc """
  Create a new `t:ExPaypal.Data.Metadata.t/0` struct

  ## Parameters

    - `pairs`: A list of `t:ExPaypal.Data.NameValuePair.t/0` structs

  ## Examples

      iex> Metadata.new(pairs)
      %Metadata{supplementary_data: [%NameValuePair{name: "key", value: "value"}]}

  """
  @spec new([NameValuePair.t]) :: __MODULE__.t
  def new(pairs) do
    struct(__MODULE__, supplementary_data: pairs)
  end
end
