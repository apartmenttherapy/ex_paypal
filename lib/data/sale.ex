defmodule ExPaypal.Data.Sale do
  @moduledoc """
  The [`sale` object](https://developer.paypal.com/docs/api/orders/v1/#definition-sale) for PayPal.
  """

  defstruct [:id, :amount, :transaction_fee, :status, :create_time, :update_time, :links]
  @type t :: %__MODULE__{id: String.t,
                         amount: Amount.t,
                         transaction_fee: Currency.t,
                         status: status,
                         create_time: String.t,
                         update_time: String.t,
                         links: [LinkDescription.t]}

  @type status :: :COMPLETED
                  | :PARTIALLY_REFUNDED
                  | :PENDING
                  | :REFUNDED
                  | :DENIED

  @type data :: [{:id, String.t},
                 {:amount, Amount.t},
                 {:transaction_fee, Currency.t},
                 {:status, status},
                 {:create_time, String.t},
                 {:update_time, String.t},
                 {:links, [LinkDescription.t]}]

  @doc """
  Creates a `t:ExPaypal.Data.Sale.t/0` struct

  ## Parameters

    - `data`: The sale data (`t:ExPaypal.Data.Sale.data/0`)

  ## Examples

      iex> Sale.new(id: "42", status: :DENIED)
      %Sale{id: "42", status: :DENIED}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
