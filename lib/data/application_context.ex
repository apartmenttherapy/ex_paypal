defmodule ExPaypal.Data.ApplicationContext do
  @moduledoc """
  The [`application_context` object](https://developer.paypal.com/docs/api/orders/v1/#definition-application_context) for PayPal.
  """

  defstruct [
              :brand_name,
              :locale,
              :landing_page,
              :shipping_preference,
              :user_action,
              :supplementary_data
            ]
  @type t :: %__MODULE__{
               brand_name: String.t,
               locale: String.t,
               landing_page: landing,
               shipping_preference: shipping,
               user_action: String.t,
               supplementary_data: [%{String.t => String.t}]
             }
  @typep landing :: :Billing | :Login
  @typep shipping :: :NO_SHIPPING
                     | :GET_FROM_FILE
                     | :SET_PROVIDED_ADDRESS

  @type data :: [{:brand_name, String.t},
                 {:locale, String.t},
                 {:landing_page, landing},
                 {:shipping_preference, shipping},
                 {:user_action, String.t},
                 {:supplementary_data, [%{String.t => String.t}]}]
  @doc """
  Creates a new `t:ExPaypal.Data.AccplicationContext.t/0` struct

  ## Parameters

    - `data`: The context data `t:ExPaypal.Data.data/0`

  ## Examples

      iex> ApplicationContext.new(brand_name: "Junk", shipping_preference: :SET_PROVIDED_ADDRESS)
      %ApplicationContext{brand_name: "Junk", shipping_preference: :SET_PROVIDED_ADDRESS}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
