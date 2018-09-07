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
               metadata: %{supplementary_data: [%{String.t => String.t}]},
               redirect_urls: RedirectUrls.t
             }

  @type intent :: :SALE | :AUTHORIZE
end
