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

  @type opts :: [integration_type: type]

  @doc """
  Create a `t:ExPaypal.Data.RestAPIIntegration.t/0` struct

  ## Parameters

    - `method`: The integratino method (`t:ExPaypal.Data.RestAPIIntegration.method/0`)

  ## Examples

      iex> RestAPIIntegration.new(:PAYPAL)
      %RestAPIIntegration{integration_method: :PAYPAL}

  """
  @spec new(method) :: __MODULE__.t
  def new(method) do
    struct(__MODULE__, integration_method: method)
  end

  @doc """
  Create a `t:ExPaypal.Data.RestAPIIntegration.t/0` struct with optional data

  ## Parameters

    - `method`: The integration method (`t:ExPaypal.Data.RestAPIIntegration.method/0`)
    - `opts`: Optional integration data (`t:ExPaypal.Data.RestAPIIntegration.opts/0`)

  ## Examples

      iex> RestAPIIntegration.new(:BRAINTREE, integration_type: :THIRD_PARTY)
      %RestAPIIntegration{integration_method: :BRAINTREE, integration_type: :THIRD_PARTY}

  """
  @spec new(method, opts) :: __MODULE__.t
  def new(method, opts) do
    parts = [integration_method: method] ++ opts
    struct(__MODULE__, parts)
  end
end
