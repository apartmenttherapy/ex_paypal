defmodule ExPaypal.Response.Onboard do
  @moduledoc """
  The Onboarding response from PayPal
  """

  alias ExPaypal.Data.LinkDescription

  defstruct links: []
  @type t :: %__MODULE__{links: [LinkDescription.t]}

  @doc """
  Create an `t:ExPaypal.Response.Onboard.t/0` struct

  ## Parameters

    - `data`: The response data (`t:map/0`)

  ## Examples

      iex> Onboard.new(payload)
      %Onboard{links: [%LinkDescription{href: "https://example.com", method: :GET, rel: "action_url"}]}

  """
  @spec new(map) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, links: Enum.map(data["links"], &build_link/1))
  end

  defp build_link(link) do
    LinkDescription.new(link["href"], link["rel"], link_method(link["method"]))
  end

  defp link_method(nil), do: nil
  defp link_method(method), do: String.to_atom(method)

  @doc """
  Returns the Action URL from the response if there is one

  ## Parameters

    - `record`: The `t:ExPaypal.Response.Onboard.t/0` struct to be checked

  ## Examples

      iex> Onboard.action_url(onboard)
      %LinkDescription{href: "https://example.com", rel: "action_url", method: :GET}

  """
  def action_url(record) do
    record.links()
    |> Enum.find(fn link -> link.rel() == "action_url" end)
  end
end
