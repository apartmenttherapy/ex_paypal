defmodule ExPaypal.Response.Order do
  @moduledoc """
  A data structure representing a PayPal response to an `t:ExPaypal.Data.Order.t/0` related action.
  """

  alias ExPaypal.Data.{Amount, LinkDescription, Order, Payee, PurchaseUnit}

  defstruct created_at: nil,
            gross: nil,
            id: nil,
            links: [],
            purchase_units: [],
            status: nil
  @type t :: %__MODULE__{created_at: DateTime.t,
                         gross: Amount.t,
                         id: String.t,
                         links: [LinkDescription.t, ...],
                         purchase_units: [PurchaseUnit.t],
                         status: Order.status}

  @doc """
  Create a `t:ExPaypal.Response.Order.t/0` struct

  ## Preference

    - `data`: The data from which to build the order response.  This will typically come directly from PayPal (see `ExPaypal.API.Payload.order_response/1`)

  ## Examples

      iex> Order.new(%{"id" => "42"})
      %Order{id: "42"}

  """
  @spec new(map) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, attributes(data))
  end

  defp attributes(data) do
    [
      created_at: created(data["create_time"]),
      gross: amount(data["gross_total_amount"]),
      id: data["id"],
      links: Enum.map(data["links"] || [], &build_link/1),
      purchase_units: Enum.map(data["purchase_units"] || [], &build_unit/1),
      status: status(data["status"])
    ]
  end

  defp created(nil), do: nil
  defp created(timestamp) do
    Timex.parse!(timestamp, "{ISO:Extended}")
  end

  defp amount(nil), do: nil
  defp amount(%{"value" => total, "currency" => currency}) do
    Amount.new(total, currency)
  end
  defp amount(%{"total" => total, "currency" => currency}) do
    Amount.new(total, currency)
  end

  defp build_link(link) do
    LinkDescription.new(link["href"], link["rel"], link["method"])
  end

  defp build_unit(unit) do
    amt = amount(unit["amount"])
    payee = payee(unit["payee"])
    status = String.to_atom(unit["status"])

    PurchaseUnit.new(unit["reference_id"], amt, payee: payee, status: status)
  end

  defp payee(nil), do: nil
  defp payee(data) do
    Payee.new(email: data["email"], merchant_id: data["merchant_id"])
  end

  defp status(nil), do: nil
  defp status(val) do
    String.to_atom(val)
  end

  @doc """
  Returns the Action URL from the response if there is one

  ## Parameters

    - `record`: The `t:ExPaypal.Response.Onboard.t/0` struct to be checked

  ## Examples

      iex> Order.approval_url(response)
      %LinkDescription{href: "https://example.com", rel: "approval_url", method: :GET}

  """
  def approval_url(record) do
    record.links()
    |> Enum.find(fn link -> link.rel() == "approval_url" end)
  end
end
