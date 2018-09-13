defmodule ExPaypal.Data.ShippingAddress do
  @moduledoc """
  The [`shipping_address` object](https://developer.paypal.com/docs/api/orders/v1/#definition-shipping_address) for PayPal.
  """

  @enforce_keys [:country_code, :line1]
  defstruct [:line1, :line2, :city, :country_code, :postal_code, :state, :phone, :normalization_status, :type, :recipient_name]
  @type t :: %__MODULE__{line1: String.t,
                         line2: String.t,
                         city: String.t,
                         country_code: String.t,
                         postal_code: String.t,
                         state: String.t,
                         phone: String.t,
                         normalization_status: norm_status,
                         type: String.t,
                         recipient_name: String.t}

  @type norm_status :: :UNKNOWN
                       | :UNNORMALIZED_USER_PREFERRED
                       | :NORMALIZED
                       | :UNNORMALIZED

  @type opt_data :: [line2: String.t,
                     city: String.t,
                     postal_code: String.t,
                     state: String.t,
                     phone: String.t,
                     normalization_status: norm_status,
                     type: String.t,
                     recipient_name: String.t]

  @doc """
  Creates a new `t:ExPaypal.Data.ShippingAddress.t/0` struct

  ## Parameters

    - `line1`: The main address line
    - `country`: The country code for the address
    - `opt_data`: The optional data for the shipping address (`t:ExPaypal.Data.ShippingAddress.opt_data/0`)

  ## Examples

      iex> ShippingAddress.new("42 Main St.", "US", city: "Albuquerque")
      %ShippingAddress{line1: "42 Main St.", country_code: "US", city: "Albuquerque"}

  """
  @spec new(String.t, String.t, opt_data) :: __MODULE__.t
  def new(line1, country, opt_data) do
    parts = [line1: line1, country_code: country] ++ opt_data

    struct(__MODULE__, parts)
  end
end
