defmodule ExPaypal.Data.EmailAddressTest do
  use ExUnit.Case

  alias ExPaypal.Data.EmailAddress
  doctest EmailAddress

  defp really_long_address do
    """
    akdghdkaldfkdgheiedkghek@dkghektherketheekthkdhgirhirhbirhaoshgioahobhaorhgouhoaoibhafoihlankd.soqrhgoaroiaslasdgihrwoirwhagofdhbasoidhrsoighowaerhgoiasdvoidhrwogowrighoashgoarghoiwehoahgoiarwhgoirweahgoarhgoiawrhgoiawrhgoiwarhgoiarwhgasocvhwoirhgaohboiawrowrghoiarhoar.com
    """
  end
end
