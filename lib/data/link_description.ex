defmodule ExPaypal.Data.LinkDescription do
  @moduledoc """
  The [`link_description` object](https://developer.paypal.com/docs/api/orders/v1/#definition-link_description) for PayPal.
  """

  @enforce_keys [:href, :rel]
  defstruct [:href, :rel, :method]
  @type t :: %__MODULE__{href: String.t,
                         rel: String.t,
                         method: verb}
  @type verb :: :GET
                | :POST
                | :PUT
                | :DELETE
                | :HEAD
                | :CONNECT
                | :OPTIONS
                | :PATCH

  @doc """
  Creates a `t:ExPaypal.Data.LinkDescription.t/0` struct

  ## Parameters

    - `href`: The full `URL` for the link
    - `rel`: The [relation type](https://tools.ietf.org/html/rfc5988#section-4) for the `URL`

  ## Examples

      iex> LinkDescription.new("http://www.example.com", "canonical")
      %LinkDescription{href: "http://www.example.com", rel: "canonical"}

  """
  @spec new(String.t, String.t) :: __MODULE__.t
  def new(href, rel) do
    struct(__MODULE__, href: href, rel: rel)
  end

  @doc """
  Creates a `t:ExPaypal.data.LinkDescription.t/0` struct with a `t:ExPaypal.Data.LinkDescription.verb/0`

  ## Parameters

    - `href`:  The full `URL` for the link
    - `rel`: The [relation type](https://tools.ietf.org/html/rfc5988#section-4) for the `URL`
    - `method`: The `HTTP` method that should be used to visit the `URL`

  ## Examples

      iex> LinkDescription.new("http://www.example.com", "canonical", :GET)
      %LinkDescription{href: "http://www.example.com", rel: "canonical", method: :GET}

  """
  @spec new(String.t, String.t, verb) :: __MODULE__.t
  def new(href, rel, method) do
    struct(__MODULE__, href: href, rel: rel, method: method)
  end
end
