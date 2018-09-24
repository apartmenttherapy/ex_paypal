defmodule ExPaypal.API.Payload do
  @moduledoc """
  Functions for managing the "to and from" for PayPal requests/responses.
  """

  alias ExPaypal.Response.{Onboard, Order}

  @doc """
  Builds a JSON payload from the given struct.

  ## Parameters

    - `struct`: A struct to be converted to `JSON` for PayPal

  ## Examples

      iex> Payload.as_json(%Amount{total: "42.42", currency: "USD"})
      \"{\\"total\\":\\"42.42\\",\\"currency\\":\\"USD\\"}\"

  """
  @spec as_json(map) :: String.t
  def as_json(%{} = record) do
    record
    |> compact()
    |> Poison.encode!(pretty: true)
  end

  defp compact(%_{} = record) do
    record
    |> Map.from_struct()
    |> compact()
  end
  defp compact(record) when is_map(record) do
    Enum.reduce(record, %{}, &process_pair/2)
  end
  defp compact(values) when is_list(values) do
    Enum.map(values, fn %_{} = record ->
                          compact(record)
                        values when is_list(values) ->
                          compact(values)
                        value ->
                          value
                      end)
  end

  defp process_pair({:__struct__, _}, record), do: record
  defp process_pair({_, nil}, record), do: record
  defp process_pair({key, %_{} = value}, record) do
    Map.put(record, key, compact(value))
  end
  defp process_pair({key, values}, record) when is_list(values) do
    Map.put(record, key, compact(values))
  end
  defp process_pair({key, value}, record) do
    Map.put(record, key, value)
  end

  @doc """
  Converts an Order Creation response to an `t:ExPaypal.Response.Order.t/0` struct

  ## Parameters

    - `response`: The response body

  """
  @spec order_response({:ok, HTTPoison.t} | {:error, HTTPoison.Error.t}) :: {:ok, Order.t} | {:error, any}
  def order_response({:error, error}), do: {:error, error.reason()}
  def order_response({:ok, response}) do
    {:ok, Order.new(response.body())}
  end

  @doc """
  Converts an Onboard response to an `t:ExPaypal.Response.Onboard.t/0` struct

  ## Parameters

    - `response`: The response body

  ## Example

      iex> Payload.onboard_response({:ok, %{body: onboard_payload})
      {:ok, %Onboard{links: [%LinkDescription{href: "https://example.com", method: :GET, rel: "self"}]}}

  """
  @spec onboard_response({:ok, HTTPoison.t} | {:error, HTTPoison.Error.t}) :: {:ok, Onboard.t} | {:error, any}
  def onboard_response({:error, error}), do: {:error, error.reason()}
  def onboard_response({:ok, response}) do
    {:ok, Onboard.new(response.body())}
  end
end
