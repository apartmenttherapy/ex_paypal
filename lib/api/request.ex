defmodule ExPaypal.API.Request do
  @moduledoc """
  This module handles making requests to the PayPal API.
  """

  use HTTPoison.Base

  alias ExPaypal.API.{Auth, Payload}
  alias ExPaypal.Data.Order

  @endpoint Application.get_env(:ex_paypal, :base_url)

  @doc """
  Initiate onboarding

  ## Parameters

    - `onboard`: A `t:ExPaypal.Data.Onboard.t/0` struct

  """
  @spec onboard(ExPaypal.Data.Onboard.t) :: {:ok, ExPaypal.Response.Onboard.t} | {:error, any}
  def onboard(onboard) do
    "v1/customer/partner-referrals"
    |> post(Payload.as_json(onboard))
    |> Payload.onboard_response()
  end

  @doc """
  Create an order

  ## Parameters

    - `order`: A `t:ExPaypal.Data.Order.t/0` struct

  """
  @spec create_order(ExPaypal.Data.Order.t) :: {:ok, ExPaypal.Response.Order.t} | {:error, any}
  def create_order(order) do
    "v1/checkout/orders"
    |> post(Payload.as_json(order))
    |> Payload.order_response()
  end

  @doc """
  Pay the given order

  ## Parameters

    - `order_id`: The Order ID as returned by PayPal

  """
  @spec pay(String.t) :: {:error, map} | {:ok, map}
  def pay(order_id) do
    post("v1/checkout/orders/#{order_id}/pay", "{\"disbursement_mode\":\"DELAYED\"}")
  end

  @doc """
  Get the status of the given order

  ## Parameters

    - `order_id`: The Order ID to check

  """
  @spec order_status(String.t) :: {:ok, Order.status} | {:error, term}
  def order_status(order_id) do
    order_id
    |> order_status_path()
    |> get()
    |> case do
      {:ok, %{body: body}} when is_map(body) ->
        {:ok, Order.status(body["status"])}
      {:ok, %{body: body}} when is_binary(body) ->
        {:error, body}
      {:error, %{reason: reason}} ->
        {:error, reason}
    end
  end

  defp order_status_path(order_id) do
    "v1/checkout/orders/#{order_id}"
  end

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
    ] ++ env_headers()
  end

  def env_headers do
    bn_header() ++ client_meta_header()
  end

  def bn_header do
    case Application.get_env(:ex_paypal, :bn_code) do
      nil ->
        []
      code ->
        [{"PayPal-Partner-Attribution-Id", code}]
      end
  end

  def client_meta_header do
    case Application.get_env(:ex_paypal, :client_meta) do
      nil ->
        []
      code ->
        [{"PayPal-Client-Metadata-Id", code}]
    end
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
