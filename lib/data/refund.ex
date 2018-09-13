defmodule ExPaypal.Data.Refund do
  @moduledoc """
  The [`refund` object](https://developer.paypal.com/docs/api/orders/v1/#definition-refund) for PayPal.
  """

  defstruct [:id, :amount, :capture_id, :sale_id, :status, :links]
  @type t :: %__MODULE__{id: String.t,
                         amount: Ammount.t,
                         capture_id: String.t,
                         sale_id: String.t,
                         status: status,
                         links: [LinkDescription.t]}

  @type status :: :PENDING
                  | :COMPLETED
                  | :FAILED

  @type data :: [{:id, String.t},
                 {:amount, Amount.t},
                 {:capture_id, String.t},
                 {:sale_id, String.t},
                 {:status, status},
                 {:links, [LinkDescription.t]}]

  @doc """
  Create a `t:ExPaypal.Data.Refunt.d/0` struct

  ## Parameters

    - `data`: The refund data (`t:ExPaypal.Data.Refund.data/0`)

  ## Examples

      iex> Refund.new(id: "42", status: :COMPLETED)
      %Refund{id: "42", status: :COMPLETED}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
