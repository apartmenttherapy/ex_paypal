defmodule ExPaypal.API.Payload do
  @moduledoc """
  Functions for managing the "to and from" for PayPal requests/responses.
  """

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
    |> Poison.encode!()
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
end
