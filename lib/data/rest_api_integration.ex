defmodule ExPaypal.Data.RestAPIIntegration do
  @moduledoc """
  The [`rest_api_integration` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-rest_api_integration) for PayPal
  """

  defstruct [:integration_method, :integration_type]
  @type t :: %__MODULE__{
               integration_method: method,
               integration_type: type
             }

  @type method :: :PAYPAL | :BRAINTREE
  @type type :: :THIRD_PARTY
end
