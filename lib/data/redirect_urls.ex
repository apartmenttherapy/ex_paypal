defmodule ExPaypal.Data.RedirectUrls do
  @moduledoc """
  The [`redirect_urls` object](https://developer.paypal.com/docs/api/orders/v1/#definition-redirect_urls) for PayPal.
  """

  defstruct [:return_url, :cancel_url]
  @type t :: %__MODULE__{return_url: String.t, cancel_url: String.t}

  @type data :: [{:return_url, String.t},
                 {:cancel_url, String.t}]

  @doc """
  Creates a `t:ExPaypal.Data.RedirectUrls.t/0` struct

  ## Parameters

    - `urls`: The `URL`s to be used (`t:ExPaypal.Data.RedirectUrls.data/0`)

  ## Examples

      iex> RedirectUrls.new(return_url: "https://www.example.com/sale")
      %RedirectUrls{return_url: "https://www.example.com/sale"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
