defmodule ExPaypal.Data.Item do
  @moduledoc """
  The [`item` object](https://developer.paypal.com/docs/api/orders/v1/#definition-item) for PayPal
  """

  @enforce_keys [:quantity, :price, :currency]
  defstruct [:sku, :name, :description, :quantity, :price, :currency, :tax]
  @type t :: %__MODULE__{sku: String.t,
                         name: String.t,
                         description: String.t,
                         quantity: String.t,
                         price: String.t,
                         currency: String.t,
                         tax: String.t}

  @type data :: [{:sku, String.t},
                 {:name, String.t},
                 {:description, String.t},
                 {:quantity, String.t},
                 {:price, String.t},
                 {:currency, String.t},
                 {:tax, String.t}]

  @doc """
  Create a new `t:ExPaypal.Data.Item.t/0` struct

  ## Parameters

    - `data`: The data for the `Item` (`t:ExPaypal.Data.Item.data/0`)

  ## Examples

      iex> Item.new(sku: "SKU", quantity: "1", price: "42.00", currency: "USD")
      {:ok, %Item{sku: "SKU", quantity: "1", price: "42.00", currency: "USD"}}

      iex> Item.new(sku: "SKU")
      {:error, missing: [:currency, :price, :quantity]}

  """
  @spec new(data) :: {:ok, __MODULE__.t} | {:error, Keyword.t}
  def new(data) do
    Enum.reduce(data, required(), &validate/2)
    |> MapSet.to_list()
    |> case do
      [] ->
        {:ok, struct(__MODULE__, data)}
      missing ->
        {:error, missing: missing}
    end
  end

  defp required do
    MapSet.new([
      :quantity,
      :price,
      :currency
    ])
  end

  defp validate({attr, _}, reqs) do
    MapSet.delete(reqs, attr)
  end
end
