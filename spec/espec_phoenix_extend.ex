defmodule ESpec.Phoenix.Extend do

  @moduledoc """
  Use this module to import or alias additional modules in your specs.
  """

  def model do
    quote do
      alias PhoenixIntercoolerTutorial.Repo
    end
  end

  def controller do
    quote do
      alias PhoenixIntercoolerTutorial
      import PhoenixIntercoolerTutorialWeb.Router.Helpers

      use Hound.Helpers

      before do
        metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(
          PhoenixIntercoolerTutorial.Repo,
          self()
        )
        Hound.start_session(
          additional_capabilities: %{
            chromeOptions: %{ "args" => [
              "--user-agent=#{Hound.Browser.user_agent(:chrome) |> Hound.Metadata.append(metadata)}",
              "--headless",
              "--disable-gpu"
            ]}
          }
        )
      end

      finally do
        delete_cookies()
        Hound.end_session()
      end

      @endpoint PhoenixIntercoolerTutorialWeb.Endpoint
    end
  end

  def view do
    quote do
      import PhoenixIntercoolerTutorialWeb.Router.Helpers
    end
  end

  def channel do
    quote do
      alias PhoenixIntercoolerTutorial.Repo

      @endpoint PhoenixIntercoolerTutorialWeb.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
