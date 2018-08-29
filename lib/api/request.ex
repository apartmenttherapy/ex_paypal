defmodule ExPaypal.API.Request do
  @moduledoc """
  This module handles making requests to the PayPal API.
  """

  use HTTPoison.Base

  @endpoint Application.get_env(:ex_paypal, :base_url)

  def process_url(url) do
    @endpoint <> url
  end

  def process_request_headers(headers) do
    default_headers() ++ headers
  end

  def default_headers do
    [
      {"Accept", "application/json"},
      {"Accept-Language", "en_US"}
    ]
  end

  def process_response_body(body) do
    {:ok, body} = Poison.decode(body)

    body
  end
end
