defmodule ExPaypal.Data.Consumer do
  @moduledoc """
  A PayPal consumer record
  """

  defstruct customer_type: "CONSUMER",
            person_details: %{},
            financial_instrument_data: nil

end
