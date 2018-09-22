defmodule ExPaypal.Data.Name do
  @moduledoc """
  The [`name` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-name) for PayPal
  """

  defstruct [:prefix,
             :given_name,
             :surname,
             :middle_name,
             :suffix,
             :alternate_full_name]
  @type t :: %__MODULE__{prefix: nil | String.t,
                         given_name: nil | String.t,
                         surname: nil | String.t,
                         middle_name: nil | String.t,
                         suffix: nil | String.t,
                         alternate_full_name: nil | String.t}

  @type data :: [{:prefix, String.t},
                 {:given_name, String.t},
                 {:surname, String.t},
                 {:middle_name, String.t},
                 {:suffix, String.t},
                 {:alternate_full_name, String.t}]

  @doc """
  Creates a new `t:ExPaypal.Data.Name.t/0` struct

  ## Parameters

    - `parts`: The parts of the name (`t:ExPaypal.Data.Name.data/0`)

  ## Examples

      iex> Name.new(prefix: "Dr.", surname: "Strangelove")
      %Name{prefix: "Dr.", surname: "Strangelove"}

  """
  @spec new(data) :: __MODULE__.t
  def new(parts) do
    struct(__MODULE__, parts)
  end
end
