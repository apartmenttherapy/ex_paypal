defmodule ExPaypal.Data.Order do
  @moduledoc """
  A PayPal Order (purchase request)
  """

  alias ExPaypal.Data.{ApplicationContext,
                       Currency,
                       PaymentDetails,
                       PurchaseUnit,
                       RedirectUrls}

  defstruct [:application_context,
             :gross_total_amount,
             :intent,
             :metadata,
             :payment_details,
             :purchase_units,
             :redirect_urls]
  @type t :: %__MODULE__{
               application_context: ApplicationContext.t,
               intent: intent,
               purchase_units: [PurchaseUnit.t],
               payment_details: PaymentDetails.t,
               gross_total_amount: Currency.t,
               metadata: Metadata.t,
               redirect_urls: RedirectUrls.t
             }

  @type intent :: :SALE | :AUTHORIZE

  @type opts :: [{:application_context, ApplicationContext.t},
                 {:intent, intent},
                 {:payment_details, PaymentDetails.t},
                 {:gross_total_amount, Currency.t},
                 {:metadata, Metadata.t}]

  @type status :: :CREATED
                  | :APPROVED
                  | :COMPLETED
                  | :FAILED

  @doc """
  Creates a `t:ExPaypal.Data.Order.t/0` struct

  ## Parameters

    - `units`: The _Purchase Unit(s)_ for the Order ([`t:ExPaypal.Data.PurchaseUnit.t/0`, ...] or `t:ExPaypal.Data.PurchaseUnit.t/0`)
    - `redirects`: The _Redirect URLs_ for the Order (`t:ExPaypal.Data.RedirectUrls.t/0`)

  ## Examples

      iex> Order.new(unit1, %RedirectUrls{})
      %Order{purchase_units: [%PurchaseUnit{reference_id: "42", amount: %Amount{currency: "USD", total: "400.00"}}], redirect_urls: %RedirectUrls{}}

  """
  @spec new(PurchaseUnit.t | [PurchaseUnit.t, ...], RedirectUrls.t) :: __MODULE__.t
  def new(units, redirects) when is_list(units) do
    struct(__MODULE__, purchase_units: units, redirect_urls: redirects)
  end
  def new(unit, redirects) do
    struct(__MODULE__, purchase_units: [unit], redirect_urls: redirects)
  end

  @doc """
  Creates a `t:ExPaypal.Data.Order.t/0` struct with optional data

  ## Parameters

    - `units`: The _Purchase Unit(s)_ for the Order ([`t:ExPaypal.Data.PurchaseUnit.t/0`, ...] or `t:ExPaypal.Data.PurchaseUnit.t/0`)
    - `redirects`: The _Redirect URLs_ for the Order (`t:ExPaypal.Data.RedirectUrls.t/0`)
    - `opts`: Any optional data for the Order (`t:ExPaypal.Data.Order.opts/0`)

  ## Examples

      iex> Order.new([unit1], %RedirectUrls{}, intent: :SALE)
      %Order{purchase_units: [%PurchaseUnit{reference_id: "42", amount: %Amount{currency: "USD", total: "400.00"}}], redirect_urls: %RedirectUrls{}, intent: :SALE}

  """
  @spec new(PurchaseUnit.t | [PurchaseUnit.t, ...], RedirectUrls.t, opts) :: __MODULE__.t
  def new(units, redirects, opts) when is_list(units) do
    parts = [purchase_units: units, redirect_urls: redirects] ++ opts
    struct(__MODULE__, parts)
  end
  def new(unit, redirects, opts) do
    parts = [purchase_units: [unit], redirect_urls: redirects] ++ opts
    struct(__MODULE__, parts)
  end

  @doc """
  Convert a status value in a response to a `t:ExPaypal.Data.Order.status/0` value

  ## Parameters

    - `status`: The status value from PayPal

  ## Examples

      iex> Order.status("APPROVED")
      :APPROVED

  """
  @spec status(String.t) :: status
  def status(val) do
    case val do
      "CREATED" ->
        :CREATED
      "APPROVED" ->
        :APPROVED
      "COMPLETED" ->
        :COMPLETED
      "FAILED" ->
        :FAILED
    end
  end
end
