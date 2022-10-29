defmodule FilmelixirWeb.FilmsList do
  use Phoenix.LiveView
  alias Filmelixir.{Film,Repo}
  import Ecto.Query
  def mount(_params, _session, socket) do
    FilmelixirWeb.Endpoint.subscribe("films")
    films = Film |> Repo.all
    IO.inspect(films)
    film_to_watch = %Film{title: nil, genre: nil, id: nil}
    socket = assign(socket, films: films, modal: false, film_to_watch: film_to_watch)
    {:ok, socket}
  end


  def handle_event("commander", value, socket) do

    %{"id" => id} = value
    films = Film |> Repo.all
    socket = assign(socket, films: films)
    film_to_watch = Repo.get(Film, id)
    socket = assign(socket, modal: true)
    socket = assign(socket, film_to_watch: film_to_watch)
    {:noreply, socket}
  end

  def handle_event("close_modal", _value, socket) do
    socket = assign(socket, modal: false)
    {:noreply, socket}
  end

  def handle_event("confirm_command", value, socket) do

    %{"id" => id} = value
    Film
    |> where([f], f.id == ^id)
    |> Repo.delete_all()
    FilmelixirWeb.Endpoint.broadcast("films", "update", %{id: id})
    socket = assign(socket, modal: false)
    {:noreply, socket}

  end


  def handle_info(%{event: "update", payload: payload}, socket) do
    films = Film |> Repo.all
    id = String.to_integer(payload.id)
    IO.inspect("TESTTTTTTTTT")
    IO.inspect(payload.id)
    IO.inspect(socket.assigns.film_to_watch)
    IO.inspect(payload.id == socket.assigns.film_to_watch.id)
    film_to_watch_tester = Integer.to_string(socket.assigns.film_to_watch.id)
    cond do
      payload.id == film_to_watch_tester ->
        film_to_watch = %Film{title: "Ce film n'est plus disponible, il vient d'être commandé", genre: "Indisponible", id: "Indisponible"}
        socket = assign(socket, film_to_watch: film_to_watch)
        socket = assign(socket, films: films)
        {:noreply, socket}

      true ->
        socket = assign(socket, films: films)
        {:noreply, socket}

    end




  end

  def render(assigns) do
    ~H"""
      <table>
        <thead>
          <tr>
            <th>Titre</th>
            <th>Genre</th>
            <th>Commander</th>
          </tr>
        </thead>
        <tbody>
        <%= for film <- @films do %>

          <tr>
            <td><%= film.title %></td>
            <td> <%= film.genre %></td>
            <td><button phx-click="commander" phx-value-id={film.id}>Commander</button></td>
          </tr>

        <% end %>
        </tbody>
      </table>

      <%= if @modal == true do %>

        <div class="phx-modal">
          <div style="height: 300px; width: 300px; margin-top: 200px; margin-left: 30%; background-color: white; border-radius: 1rem; padding: 2rem;">
            <span>Id : </span><%= @film_to_watch.id %> <br>
            <span>Name : </span><%= @film_to_watch.title %> <br>
            <span>Genre : </span><%= @film_to_watch.genre %>
            <button phx-click="confirm_command" phx-value-id={@film_to_watch.id}>Commander</button>
            <button phx-click="close_modal">Fermer</button>
          </div>
        </div>

      <% end %>
    """
  end
end
