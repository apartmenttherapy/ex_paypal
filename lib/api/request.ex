defmodule ExPaypal.API.Request do
  @moduledoc """
  This module handles making requests to the PayPal API.
  """

  use HTTPoison.Base

  alias ExPaypal.API.Auth

  @endpoint Application.get_env(:ex_paypal, :base_url)

  def process_url(url) do
    @endpoint <> url
  end

  def process_request_headers(headers) do
    default_headers() ++ headers
  end

  @spec default_headers() :: [{<<_::48, _::_*8>>, <<_::40, _::_*8>>}, ...]
  def default_headers do
    [
      {"Authorization", "Bearer #{Auth.token().value()}"},
      {"Accept", "application/json"},
      {"Accept-Language", "en_US"},
      {"Content-Type", "application/json"}
    ]
  end

  def process_response_body(body) do
    case Poison.decode(body) do
      {:ok, body} ->
        body
      {:error, _} ->
        body
    end
  end
end
