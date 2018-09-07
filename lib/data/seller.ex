defmodule ExPaypal.Data.Seller do
  @moduledoc """
  Seller data for PayPal
  """

  alias ExPaypal.Data.BusinessDetails

  defstruct customer_type: "MERCHANT",
            business_details: nil,
            preferred_language_code: "en_US",
            primary_currency_code: "USD"

  @type t :: %__MODULE__{
               customer_type: String.t,
               business_details: nil | BusinessDetails.t,
               preferred_language_code: String.t,
               primary_currency_code: String.t
             }
end
