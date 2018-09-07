defmodule ExPaypal.Data.BusinessName do
  @moduledoc """
  The [`business_name` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-business_name) for PayPal
  """

  @enforce_keys [:type, :name]
  defstruct [:type, :name]
  @type t :: %__MODULE__{type: legal_category, name: String.t}
  @type legal_category :: :LEGAL
                          | :DOING_BUSINESS_AS
                          | :STOCK_TRADING_NAME

  @doc """
  Create a new `t:ExPaypal.Data.BusinessName.t/0` struct

  ## Parameters

    - `type`: The _legal category_ for the name, must be one of `t:ExPaypal.Data.BusinessName.legal_category/0`.
    - `name`: The name for the business, this name should line up with the type given as well.

  ## Examples

      iex> BusinessName.new(:LEGAL, "Example Corp Inc.")
      %BusinessName{type: :LEGAL, name: "Example Corp Inc."}

  """
  @spec new(legal_category, String.t) :: __MODULE__.t
  def new(type, name) do
    __MODULE__
    |> struct(type: type, name: name)
  end
end
