defmodule CowboyExample.Router do
  alias CowboyExample.Router.Handlers.{Root, Greet, Static}
  @moduledoc """
  This module defines all the routes, params and handlers.
  This module is also the handler module for the root
  route.
  """

  require Logger

  @doc """
  Returns the list of routes configured by this web server
  """
  def routes do
    [
      {:_, [
        {"/", Root, []},
        # Add this line
        {"/greet/:who", [who: :nonempty], Greet, []},
        {"/static/:page", [page: :nonempty], Static, []}
      ]}
    ]
  end
end
