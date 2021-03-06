{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:hound)

ESpec.configure fn(config) ->
  config.before fn(tags) ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PhoenixIntercoolerTutorial.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PhoenixIntercoolerTutorial.Repo, {:shared, self()})
    end

    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    Ecto.Adapters.SQL.Sandbox.checkin(PhoenixIntercoolerTutorial.Repo, [])
    :ok
  end
end

Code.require_file("spec/phoenix_helper.exs")
