Code.require_file("spec/phoenix_helper.exs")

{:ok, _} = Application.ensure_all_started(:hound)

ESpec.configure fn(config) ->
  config.before fn(tags) ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PhoenixIntercoolerTutorial.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(PhoenixIntercoolerTutorial.Repo, {:shared, self()})
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    Ecto.Adapters.SQL.Sandbox.checkin(PhoenixIntercoolerTutorial.Repo, [])
    :ok
  end
end
