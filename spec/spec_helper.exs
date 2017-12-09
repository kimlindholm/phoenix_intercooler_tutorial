Code.require_file("spec/phoenix_helper.exs")

ESpec.configure fn(config) ->
  config.before fn(tags) ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PhoenixIntercoolerTutorial.Repo)
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    Ecto.Adapters.SQL.Sandbox.checkin(PhoenixIntercoolerTutorial.Repo, [])
    :ok
  end
end
