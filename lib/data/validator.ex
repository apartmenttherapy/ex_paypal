defmodule ExPaypal.Data.Validator do
  @moduledoc """
  Runtime validations for struct data.
  """

  defstruct keys: MapSet.new([])
  @type t :: %__MODULE__{keys: MapSet.t(atom | {atom, (any -> boolean)})}

  @doc """
  Creates a new `t:ExPaypal.Data.Validator.t/0` struct

  ## Parameters

    - `reqs`: The attributes required for the record to be valid.

  ## Examples

      iex> Validator.new([:attr])
      %Validator{keys: MapSet.new([:attr])}

  """
  @spec new([atom] | [{atom, (any -> boolean)}]) :: __MODULE__.t
  def new(reqs) when is_list(reqs) do
    struct(__MODULE__, keys: MapSet.new(reqs))
  end

  @doc """
  Process the given `{key, value}` pair, this will check both presence and the typing of the value

  ## Parameters

    - `pair`: The `{key, value}` pair to be processed
    - `validator`: The validator to use to process the `pair`

  ## Examples

      iex> Validator.process({:required, "string"}, pair_validator)
      %Validator{keys: MapSet.new([])}

      iex> Validator.process({:eh, "stuff"}, pair_validator)
      %Validator{keys: MapSet.new([{:required, &is_binary/1}])}

  """
  @spec process({atom, (any -> boolean)}, __MODULE__.t) :: __MODULE__.t
  def process({key, value}, validator) do
    validator.keys()
    |> MapSet.to_list()
    |> Enum.find(fn {req_key, check} ->
         (key == req_key) && check.(value)
       end)
    |> case do
         nil ->
           validator
         match ->
           new_keys = MapSet.delete(validator.keys(), match)
           %{validator | keys: new_keys}
       end
  end

  @doc """
  Processes the given key, if the key is part of the required list then it will be tracked as present, otherwise if the key is not in the required set it will be ignored.

  ## Parameters

    - `key`: The key to be checked
    - `validator`: The validator to be used in the check

  ## Examples

      iex> Validator.process(:required, validator)
      %Validator{keys: MapSet.new([])}

      iex> Validator.process(:random, validator)
      %Validator{keys: MapSet.new([:required])}

  """
  @spec process(atom, __MODULE__.t) :: __MODULE__.t
  def process(key, validator) do
    keys =
      validator.keys()
      |> MapSet.delete(key)

    struct(validator, keys: keys)
  end

  @doc """
  Returns `true` if valid or `false` if invalid.

  ## Parameters

    - `validator`: The validator to be checked

  ## Examples

      iex> Validator.valid?(%Validator{})
      true

      iex> Validator.valid?(validator)
      false

  """
  @spec valid?(__MODULE__.t) :: boolean
  def valid?(validator) do
    MapSet.size(validator.keys()) == 0
  end
end
