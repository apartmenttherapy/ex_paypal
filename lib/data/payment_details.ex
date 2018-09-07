defmodule ExPaypal.Data.PaymentDetails do
  @moduledoc """
  The [`payment_details` object](https://developer.paypal.com/docs/api/orders/v1/#definition-payment_details) for PayPal.
  """

  defstruct [:payment_id, :disbursement_mode]
  @type t :: %__MODULE__{
               payment_id: String.t,
               disbursement_mode: dmode
             }

  @typep dmode :: :INSTANT | :DELAYED

  @doc """
  Create a new `t:ExPaypal.Data.PaymentDetails.t/0` struct

  ## Parameters

    - `id`: The payment id for the order
    - `mode`: The disbursement mode for the payment (`t:ExPaypal.Data.PaymentDetails.dmode/0`)

  ## Examples

      iex> PaymentDetails.new("42", :INSTANT)
      %PaymentDetails{payment_id: "42", disbursement_mode: :INSTANT}

  """
  @spec new(String.t, dmode) :: __MODULE__.t
  def new(id, mode) do
    struct(__MODULE__, payment_id: id, disbursement_mode: mode)
  end
end
