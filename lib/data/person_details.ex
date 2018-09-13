defmodule ExPaypal.Data.PersonDetails do
  @moduledoc """
  The [`person_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-person_details) for PayPal
  """

  defstruct [:email_address,
             :name,
             :phone_contacts,
             :home_address,
             :date_of_birth,
             :nationality_country_code,
             :identity_documents,
             :account_owner_relationships]
  @type t :: %__MODULE__{email_address: nil | String.t,
                         name: nil | Name.t,
                         phone_contacts: nil | [PhoneDetails.t, ...],
                         home_address: nil | Address.t,
                         date_of_birth: nil | EventDate.t,
                         nationality_country_code: nil | String.t,
                         identity_documents: nil | [IdentityDocument.t, ...],
                         account_owner_relationships: nil | [AccountOwnerRelationship.t, ...]}

  @type data :: [{:email_address, String.t},
                 {:name, Name.t},
                 {:phone_contacts, [PhoneDetails.t, ...]},
                 {:home_address, Address.t},
                 {:date_of_birth, EventDate.t},
                 {:nationality_country_code, String.t},
                 {:identity_documents, [IdentityDocument.t, ...]},
                 {:account_owner_relationships, [AccountOwnerRelationship.t, ...]}]

  @doc """
  Creates a `t:ExPaypal.Data.PersonDetails.t/0` struct

  ## Parameters

    - `details`: The details for the person (`t:ExPaypal.Data.PersonDetails.data/0`)

  ## Examples

      iex> PersonDetails.new(email_address: "joe@example.com")
      %PersonDetails{email_address: "joe@example.com"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end
end
