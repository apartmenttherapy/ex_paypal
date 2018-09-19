defmodule ExPaypal.API.PayloadTest do
  use ExUnit.Case

  alias ExPaypal.API.Payload
  alias ExPaypal.Data.{Amount, LinkDescription}
  alias ExPaypal.Response.{Onboard, Order}

  doctest Payload

  test "`as_json/1` purnes nil values in nested structs" do
    assert expected() == Payload.as_json(in_struct())
  end

  test "`as_json/1` prunes nil values in nested maps" do
    assert "{\"id\":\"42\",\"amount\":#{expected()}}" == Payload.as_json(in_map())
  end

  test "`as_json/1` prunes nil values in structs nested in lists" do
    assert "{\"list\":[#{expected()}]}" == Payload.as_json(in_list())
  end

  defp in_struct do
    %Amount{
      total: "42.42",
      currency: "USD",
      details: %ExPaypal.Data.Details{
        subtotal: "33.25",
        shipping: "6.00",
        tax: "3.17"
      }
    }
  end

  defp in_map do
    %{
      id: "42",
      amount: in_struct()
    }
  end

  defp in_list do
    %{list: [in_struct()]}
  end

  defp expected do
    """
    {"total":"42.42","details":{"tax":"3.17","subtotal":"33.25","shipping":"6.00"},"currency":"USD"}
    """ |> String.strip()
  end

  alias ExPaypal.Response.{OnboardTest, OrderTest}

  defp onboard_payload, do: OnboardTest.payload()
  defp order_payload, do: OrderTest.payload()
end
