defmodule ExPaypal.Data.AccountOwnerRelationship do
  @moduledoc """
  The [`account_owner_relationship` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-account_owner_relationship) for PayPal
  """

  @enforce_keys [:name, :country_code_of_nationality]
  defstruct name: nil
            relation: :MOTHER
            country_code_of_nationality: nil
  @type t :: %__MODULE__{name: nil | Name.t,
                         relation: :MOTHER,
                         country_code_of_nationality: nil | String.t}

  @doc """
  Creates a `t:ExPaypal.Data.AccountOwnerRelationship.t/0` struct

  ## Parameters

    - `name`: The name of the related person (`t:ExPaypal.Data.Name.t/0`)
    - `nationality`: The nationality of the related person

  ## Examples

      iex> AccountOwnerRelationship.new(%Name{}, "US")
      %AccountOwnerRelationship{name: %Name{}, relation: :MOTHER, country_code_of_nationality: "US"}

  """
  @spec new(Name.t, String.t) :: __MODULE__.t
  def new(name, nationality) do
    struct(__MODULE__, name: name, country_code_of_nationality: nationality)
  end
end
