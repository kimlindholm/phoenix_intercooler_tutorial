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
