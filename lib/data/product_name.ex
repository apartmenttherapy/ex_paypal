defmodule ExPaypal.Data.ProductName do
  @moduledoc """
  The [`product_name` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-product_name) for PayPal
  """

  defstruct [:product_name]
  @type t :: %__MODULE__{product_name: value}
  @type value :: :EXPRESS_CHECKOUT
                 | :PPPLUS
                 | :WP_PRO

  @doc """
  Create a new `t:ExPaypal.Data.ProductName.t/0` struct

  ## Parameters

    - `name`: The product name (`t:ExPaypal.Data.ProductName.value/0`)

  ## Examples

      iex> ProductName.new(:EXPRESS_CHECKOUT)
      {:ok, %ProductName{product_name: :EXPRESS_CHECKOUT}}

      iex> ProductName.new(:FLURB)
      {:error, :invalid_product}

  """
  @spec new(value) :: {:ok, __MODULE__.t} | {:error, :invalid_product}
  def new(name) do
    if MapSet.member?(valid_names(), name) do
      {:ok, %__MODULE__{product_name: name}}
    else
      {:error, :invalid_product}
    end
  end

  defp valid_names do
    MapSet.new([
      :EXPRESS_CHECKOUT,
      :PPPLUS,
      :WP_PRO
    ])
  end
end
