defmodule ExPaypal.Data.URL do
  @moduledoc """
  The [`website_url` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-website_url) for PayPal, yes they actually do this...
  """

  @enforce_keys [:website_url]
  defstruct [:website_url]
  @type t :: %__MODULE__{website_url: String.t}

  @doc """
  Creates a URL object for PayPal (because a string isn't good enough for them)

  ## Parameters

    - `url`: The actual thing that matters, the URL as a `String.t`

  ## Examples

      iex> URL.new("https://example.com")
      %URL{website_url: "https://example.com"}

  """
  @spec new(String.t) :: __MODULE__.t
  def new(url) do
    struct(__MODULE__, website_url: url)
  end
end
