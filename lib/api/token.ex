defmodule ExPaypal.API.Token do
  @moduledoc """
  Represents a Bearer Token for the PayPal API. In order for Authentication to be successful both your `client_id` and `client_secret` need to be configured for the `ex_paypal` application.

  ```
  config :ex_paypal,
    client_id: "<CLIENT_ID>"
    client_secret: "<CLIENT_SECRET>"
  ```
  """

  require Logger

  defstruct value: nil, expiration: nil
  @type t :: %__MODULE__{
               value: nil | String.t,
               expiration: nil | DateTime.t
             }

  @client_id Application.get_env(:ex_paypal, :client_id)
  @client_secret Application.get_env(:ex_paypal, :client_secret)

  @doc """
  Fetches a new token from PayPal.
  """
  @spec new(module) :: __MODULE__.t
  def new(via \\ HTTPoison) do
    request_token(via) || %__MODULE__{}
  end

  @spec request_token(module) :: __MODULE__.t | nil
  defp request_token(via) do
    token_url()
    |> via.post({:form, body()}, headers(), auth_options())
    |> process_response()
  end

  defp body, do: [grant_type: "client_credentials"]

  defp headers do
    [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"Accept", "application/json"},
      {"Accept-Language", "en_US"}
    ]
  end

  defp token_url do
    Application.get_env(:ex_paypal, :base_url) <> "v1/oauth2/token"
  end

  defp auth_options do
    [
      hackney: [
        basic_auth: {
          @client_id,
          @client_secret,
        }
      ]
    ]
  end

  @spec process_response({:error, map} | {:ok, map}) :: map | nil
  defp process_response({:error, %{reason: reason}}) do
    Logger.error("Failed to acquire Bearer Token: #{Kernel.inspect(reason)}")

    nil
  end
  defp process_response({:ok, %{status_code: status}}) when status >= 300 and status <= 399 do
    Logger.error("Bearer Token request was redirected")

    nil
  end
  defp process_response({:ok, %{status_code: status}}) when status >= 400 and status <= 499 do
    Logger.error("PayPal responded with a client error code (#{status}) for Bearer Token")

    nil
  end
  defp process_response({:ok, %{status_code: status}}) when status >= 500 do
    Logger.error("PayPal responded with a server error (#{status}) for Bearer Token")

    nil
  end
  defp process_response({:ok, %{body: body, status_code: 200}}) do
    from_raw(body)
  end

  @doc """
  Creates a `t:ExPaypal.API.Token.t/0` struct from a "raw" payload (`JSON` string, or map).

  ## Parameters

    - `data`: The raw token data, either in the form of a map or a raw string, this is probably a response from PayPal but who knows where you found it.

  """
  @spec from_raw(String.t | map) :: __MODULE__.t
  def from_raw(json_string) when is_binary(json_string) do
    {:ok, parsed} = Poison.decode(json_string)

    from_raw(parsed)
  end
  def from_raw(%{"access_token" => token, "expires_in" => exp}) do
    {:ok, expiration} = DateTime.from_unix(:erlang.system_time(:seconds) + exp)

    struct(__MODULE__, expiration: expiration, value: token)
  end

  @doc """
  Returns the amount of time in which the token will expire the value defaults to a number of miliseconds.

  ## Parameters

    - `token`: The token for which an expiration value should be returned
    - `unit`: The units the value should be returned in (`t:System.time_unit/0`)

  """
  @spec expires_in(__MODULE__.t, System.time_unit) :: integer
  def expires_in(token, unit) do
    token.expiration()
    |> DateTime.to_unix(unit)
    |> Kernel.-(:erlang.system_time(unit))
  end
end
