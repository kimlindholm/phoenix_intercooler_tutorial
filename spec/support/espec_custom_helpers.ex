defmodule PhoenixIntercoolerTutorial.ESpec.CustomHelpers do
  alias PhoenixIntercoolerTutorial.Repo
  import Ecto.Query

  @moduledoc """
  Custom helpers for ESpec.
  """

  @doc """
  A helper that transform changeset errors to a map of messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Enum.reduce(opts, message, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

  def last_record(model) do
    Repo.one(from x in model, order_by: [desc: x.id], limit: 1)
  end

  def number_of_records(model) do
    Repo.aggregate(model, :count, :id)
  end

end
